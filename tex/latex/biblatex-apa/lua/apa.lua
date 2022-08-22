-- From Marcel Krüger's answer at https://tex.stackexchange.com/a/654261/80496

-- How to translate boolean results to TeX macros selecting the right arguments
local bool_to_token = {[false] = token.create'use_ii:nn', [true] = token.create'use_i:nn'}

-- The codepoints we have to look for
local left_paren = string.byte'('
local right_paren = string.byte')'

-- Some boilerplate to define an unexpandable command sequence from Lua
local id = luatexbase.new_luafunction'BLTXAPAifInParensTF'
token.set_lua('BLTXAPAifInParensTF', id, 'protected')
lua.get_functions_table()[id] = function()

  -- We want to look at the current list
  local head = tex.nest.top.head

  local level = 0
  -- and look at all unprocessed characters
  for _, char in node.traverse_char(head) do
    -- Track the nesting level
    if char == left_paren then
      level = level + 1
    elseif char == right_paren then
      if level > 0 then
        level = level - 1
      else
        -- Negative levels don't make sense, so we ignore the ) instead. Print a warning though to avoid surprises.
        luatexbase.module_warning('biblatex-apa', '\z
          Unable to reliably determine if inside parentheses\z
          since the paragraphs contains an unmatched `)` - will be ignored\z
        ')
      end
    end
  end
  -- Finally insert a macro which will select the first or second argument dependingon whether level > 0
  token.put_next(bool_to_token[level > 0])
end
