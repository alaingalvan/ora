import { format } from "prettier";
import { glob } from "glob";
import { readFile, writeFile } from "node:fs/promises";
async function main() {
  // Format with prettier's typescript parser:
  let formatterPaths = ["./scripts/**/*.gml", "./objects/**/*.gml"];

  // GML <-> JS Mapping
  let gml_ds_2d_getter = /\[\(([^\[\(\)\]]+)\)\]/g; // Prettier adds parens to 2D arrays.
  let gml_do_while = /(do\s+{\s*((.|\n)+)\s*})\s*until\s+\(/g; // GML do {} until () is the same as do while.
  let gml_multiline = /@\"\s*([^@][^\")]+)\s*\"/g; // @" <body> " - GML multiline strings start with @.
  let gml_accessor = /\[\s*@\s*([^\s]+)\s*\]/g; // [@ <identifier>] - defines an accessor, equivalent to C# get/set behavior for variables.
  let gml_macro = /#macro\s+([^\s]+)\s+([^\n]+)/g; // #macro <identifier> <body> - GML macros look like C macros, single line.

  for (let p of formatterPaths) {
    const gmlfiles = await glob(p, { ignore: "node_modules/**" });
    for (let gmlFile of gmlfiles) {
      let text = await readFile(gmlFile, "utf8");

      // Slightly modify existing GML to look more like JavaScript:
      text = text.replaceAll(/\r\n/g, "\n");
      //text = text.replaceAll(gml_do_while, "$1 while (");
      text = text.replaceAll(gml_accessor, "[___gml_accessor($1)]");
      text = text.replaceAll(gml_macro, "___gml_macro($1, `$2`)");
      text = text.replaceAll(gml_multiline, "`$1`");
      try {
        // Format with prettier:
        let formatted = await format(text, {
          trailingComma: "none",
          parser: "typescript"
        });

        // Convert back to GML:
        formatted = formatted.replaceAll(gml_ds_2d_getter, "[$1]"); // [(x,y)]
        // do {} until () need a more complex grammar to parse.
        /*formatted = formatted.replaceAll(
            /(do\s+{[^}]+})\s*while\s+\(\(/g,
            "$1 until ("
          );*/

        formatted = formatted.replaceAll(
          /___gml_macro\(\s*([^,]+),\s*\`([^\`]+)\`\s*\);/g,
          "#macro $1 $2"
        );

        formatted = formatted.replaceAll(
          /___gml_accessor\(\s*([^\)]+)\s*\)/g,
          "@ $1"
        ); // Accessors
        formatted = formatted.replaceAll(/\`\s*([^\`)]+)s*\`/g, '@"$1"'); // Multiline string
        writeFile(gmlFile, formatted);
      } catch (e) {
        console.error(e);
      }
    }
  }
}

main();
