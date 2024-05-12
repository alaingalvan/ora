import { format } from "prettier";
import { glob } from "glob";
import { readFile, writeFile } from "fs";
async function main() {
  // Format with prettier's typescript parser:
  let formatterPaths = ["./scripts/**/*.gml", "./objects/**/*.gml"];
  let ds_2d_getter = /\[\(([^\[\(\)\]]+)\)\]/;

  for (let p of formatter_paths) {
    const gmlfiles = await glob(p, { ignore: "node_modules/**" });
    for (let gmlFile of gmlfiles) {
      const text = await readFile(gmlFile, "utf8");
      const formatted = await format(text, {
        trailingComma: "none",
        parser: "typescript"
      });
      formatted = formatted.replace(ds_2d_getter, [$1]);
      writeFile(gmlFile, formatted);
    }
  }
}

main();
