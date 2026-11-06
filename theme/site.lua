-- First H1 becomes the page title; relative .md links become site URLs;
-- the nav in site.yaml becomes the sidebar.

local stringify = pandoc.utils.stringify
local path = pandoc.path

local src, url

local function url_for(p)
  p = p:gsub("%.md$", "")
  local base = path.filename(p)
  if base == "index" or base == "_index" then
    p = path.directory(p)
  end
  if p == "." or p == "" then return "/" end
  return "/" .. p .. "/"
end

local function normalize(p)
  local parts = {}
  for seg in p:gmatch("[^/]+") do
    if seg == ".." then
      table.remove(parts)
    elseif seg ~= "." then
      table.insert(parts, seg)
    end
  end
  return table.concat(parts, "/")
end

local function page_url(page, from)
  local target = normalize(path.join({ from, page }))
  local f = io.open("docs/" .. target, "r")
  if not f then
    error(("%s: link to missing page %s"):format(src, target))
  end
  f:close()
  return url_for(target)
end

local function html(inlines)
  return pandoc.write(pandoc.Pandoc({ pandoc.Plain(inlines) }), "html"):gsub("\n$", "")
end

local function nav_list(items)
  local out = { "<ul>" }
  for _, item in ipairs(items) do
    local href = page_url(stringify(item.page), ".")
    local current = href == url and ' aria-current="page"' or ""
    local li = ('<li><a href="%s"%s>%s</a>'):format(href, current, html(item.title))
    if item.children then
      li = li .. nav_list(item.children)
    end
    table.insert(out, li .. "</li>")
  end
  table.insert(out, "</ul>")
  return table.concat(out, "\n")
end

local function Link(el)
  local t = el.target
  if t:match("^%a[%w+.-]*:") or t:match("^/") or t:match("^#") then return end
  local file, frag = t:match("^([^#]*)(#?.*)$")
  if not file:match("%.md$") then return end
  el.target = page_url(file, path.directory(src)) .. frag
  return el
end

function Pandoc(doc)
  local meta = doc.meta
  src, url = stringify(meta.src), stringify(meta.url)
  local site_name = stringify(meta["site-name"])

  for i, b in ipairs(doc.blocks) do
    if b.t == "Header" and b.level == 1 then
      meta.title = b.content
      doc.blocks:remove(i)
      break
    end
  end
  local title = meta.title and stringify(meta.title) or site_name
  meta.pagetitle = title == site_name and site_name or (title .. " · " .. site_name)

  local nav = ('<nav id="site-nav">\n<a class="site-name" href="/">%s</a>\n%s\n</nav>')
    :format(site_name, nav_list(meta.nav))
  meta["include-before"] = pandoc.MetaBlocks({ pandoc.RawBlock("html", nav) })

  if meta.footer then
    local footer = ('<footer class="site-footer">%s</footer>'):format(html(meta.footer))
    meta["include-after"] = pandoc.MetaBlocks({ pandoc.RawBlock("html", footer) })
  end

  doc = doc:walk({ Link = Link })
  return doc
end
