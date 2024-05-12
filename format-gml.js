import { format } from "prettier";
import { glob } from "glob";
import { readFile, writeFile } from "node:fs/promises";
async function main() {
  // Format with prettier's typescript parser:
  let formatterPaths = ["./scripts/**/*.gml", "./objects/**/*.gml"];

  // GML <-> JS Mapping
  let gml_ds_2d_getter = /\[\(([^\[\(\)\]]+)\)\]/g; // Prettier adds parens to 2D arrays.
  let gml_do_while = /until \(/g; // GML do {} until () is the same as do while.
  let gml_multiline = /@\"\s*([^@][^\")])*s*\"/g; // @" <body> " - GML multiline strings start with @.
  let gml_accessor = /\[\s*@\s*([^\]])*\s*\]/g; // [@ <identifier>] - defines an accessor, equivalent to C# get/set behavior for variables.
  let gml_macro = /#macro\s+([^\s]+)([^\n]+)/g; // #macro <identifier> <body> - GML macros look like C macros, single line.

  for (let p of formatterPaths) {
    const gmlfiles = await glob(p, { ignore: "node_modules/**" });
    for (let gmlFile of gmlfiles) {
      let text = await readFile(gmlFile, "utf8");

      // Slightly modify existing GML to look more like JavaScript:
      text = text.replaceAll(gml_do_while, "while (");
      text = text.replaceAll(gml_multiline, "`$1`");
      text = text.replaceAll(gml_accessor, "[___gml_accessor($1)]");
      text = text.replaceAll(gml_macro, "[___gml_macro($1, `$2`)]");

      // Format with prettier:
      let formatted = await format(text, {
        trailingComma: "none",
        parser: "typescript"
      });

      // Convert back to GML:
      formatted = formatted.replaceAll(gml_ds_2d_getter, "[$1]");
      formatted = formatted.replaceAll(/while \(/g, "until (");
      formatted = formatted.replaceAll(/\`\s*([^\`)])*s*\`/g, '@"$1"');
      formatted = formatted.replaceAll(
        /___gml_macro\(\s*([^,]+),\s* \`([^\`]+)\`\s*\)/g,
        "#macro $1 $2"
      );
      writeFile(gmlFile, formatted);
    }
  }
}

main();
