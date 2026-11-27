-- examples/ 以下のサンプルを本文に埋め込むショートコード。
--
--   {{< file first-policy/hello/policy.rego >}}  ファイルの中身をコードブロックで表示する
--   {{< run first-policy/hello >}}               cmd を実行した結果（output.txt）を表示する
--   {{< run first-policy/hello parse >}}         cmd-parse を実行した結果（output-parse.txt）を表示する

local languages = {
  rego = "rego",
  json = "json",
  yaml = "yaml",
  yml = "yaml",
  tf = "terraform",
  hcl = "terraform",
  sh = "bash",
}

local function read_file(path)
  local f = io.open(path, "r")
  if f == nil then
    error("ファイルが見つかりません: " .. path)
  end
  local content = f:read("a")
  f:close()
  return (content:gsub("\n$", ""))
end

local function example_path(rel)
  return quarto.project.directory .. "/examples/" .. rel
end

local function language_of(name)
  local base = name:match("([^/]+)$")
  if base == "Dockerfile" then
    return "dockerfile"
  end
  local ext = base:match("%.([^.]+)$")
  return languages[ext] or "default"
end

local function file(args)
  local rel = pandoc.utils.stringify(args[1])
  local name = rel:match("([^/]+)$")
  -- opa fmt はタブでインデントするが、PDF などではタブの幅が 8 文字分になって読みにくいので、
  -- 表示するときだけ空白 4 つに置き換える。
  local content = read_file(example_path(rel)):gsub("\t", "    ")
  local block = pandoc.CodeBlock(content, pandoc.Attr("", { language_of(rel) }))

  -- ショートコードの出力には Quarto のファイル名の処理（filename 属性）がかからないので、
  -- Quarto がその処理で作るノードを直接作る。文書化されていない API なので、
  -- 使えない場合はファイル名なしのコードブロックにする。
  if quarto.DecoratedCodeBlock ~= nil then
    return pandoc.Blocks({ quarto.DecoratedCodeBlock({ filename = name, code_block = block }) })
  end
  return pandoc.Blocks({ block })
end

local function run(args)
  local rel = pandoc.utils.stringify(args[1])
  -- 2 つ目の引数があれば、cmd-名前 の結果（output-名前.txt）を表示する
  local name = "output.txt"
  if args[2] ~= nil then
    name = "output-" .. pandoc.utils.stringify(args[2]) .. ".txt"
  end
  local output = read_file(example_path(rel .. "/" .. name))
  return pandoc.Blocks({ pandoc.CodeBlock(output, pandoc.Attr("", { "console" })) })
end

return {
  ["file"] = file,
  ["run"] = run,
}
