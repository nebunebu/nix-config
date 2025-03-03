# { config, ... }:
{
  xdg.configFile."aichat/dark.tmTheme".text = # xml
    ''
      <?xml version="1.0" encoding="UTF-8"?>
      <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
      <plist version="1.0">
       <dict>
        <key>name</key>
        <string>rose-pine (dark)</string>
        <key>settings</key>
        <array>
      <!-- Basics -->
         <dict>
          <key>settings</key>
          <dict>
           <key>background</key>
           <string>#191724</string>
           <key>caret</key>
           <string>#f6c177</string>
           <key>foreground</key>
           <string>#e0def4</string>
           <key>gutter</key>
           <string>#524f67</string>
           <key>invisibles</key>
           <string>#6e6a86</string>
           <key>lineHighlight</key>
           <string>#908caa</string>
           <key>misspelling</key>
           <string>#eb6f92</string>
           <key>selection</key>
           <string>#ebbcba</string>
           <key>selectionBorder</key>
           <string>#6e6a86</string>
          </dict>
         </dict>
      <!-- Generics -->
         <dict>
          <key>name</key>
          <string>Comment</string>
          <key>scope</key>
          <string>comment, meta.documentation</string>
          <key>settings</key>
          <dict>
           <key>foreground</key>
           <string>#6e6a86</string>
          </dict>
         </dict>
         <dict>
          <key>name</key>
          <string>String</string>
          <key>scope</key>
          <string>string</string>
          <key>settings</key>
          <dict>
           <key>foreground</key>
           <string>#ebbcba</string>
          </dict>
         </dict>
         <dict>
          <key>name</key>
          <string>Regexp</string>
          <key>scope</key>
          <string>string.regexp</string>
          <key>settings</key>
          <dict>
           <key>foreground</key>
           <string>#f6c177</string>
          </dict>
         </dict>
         <dict>
          <key>name</key>
          <string>Escape \ char</string>
          <key>scope</key>
          <string>constant.character.escape</string>
          <key>settings</key>
          <dict>
           <key>foreground</key>
           <string>#c4a7e7</string>
          </dict>
         </dict>
         <dict>
          <key>name</key>
          <string>Number</string>
          <key>scope</key>
          <string>constant.numeric</string>
          <key>settings</key>
          <dict>
           <key>foreground</key>
           <string>#31748f</string>
          </dict>
         </dict>
         <dict>
          <key>name</key>
          <string>Variable</string>
          <key>scope</key>
          <string>variable</string>
          <key>settings</key>
          <dict>
           <key>foreground</key>
           <string>#c4a7e7</string>
          </dict>
         </dict>
         <dict>
          <key>name</key>
          <string>Variable Function</string>
          <key>scope</key>
          <string>variable.function</string>
          <key>settings</key>
          <dict>
           <key>foreground</key>
           <string>#9ccfd8</string>
          </dict>
         </dict>
         <dict>
          <key>name</key>
          <string>Variable Language</string>
          <key>scope</key>
          <string>variable.language</string>
          <key>settings</key>
          <dict>
           <key>foreground</key>
           <string>#f6c177</string>
          </dict>
         </dict>
         <dict>
          <key>name</key>
          <string>Keyword</string>
          <key>scope</key>
          <string>keyword</string>
          <key>settings</key>
          <dict>
           <key>foreground</key>
           <string>#ebbcba</string>
          </dict>
         </dict>
         <dict>
          <key>name</key>
          <string>Import</string>
          <key>scope</key>
          <string>meta.import keyword, keyword.control.import, keyword.control.import.from, keyword.other.import, keyword.control.at-rule.include, keyword.control.at-rule.import</string>
          <key>settings</key>
          <dict>
           <key>foreground</key>
           <string>#c4a7e7</string>
          </dict>
         </dict>
         <dict>
          <key>name</key>
          <string>Arithmetical, Assignment, Comparision Operators</string>
          <key>scope</key>
          <string>keyword.operator.comparison, keyword.operator.assignment, keyword.operator.arithmetic</string>
          <key>settings</key>
          <dict>
           <key>foreground</key>
           <string>#908caa</string>
          </dict>
         </dict>
         <dict>
          <key>name</key>
          <string>Storage</string>
          <key>scope</key>
          <string>storage</string>
          <key>settings</key>
          <dict>
           <key>foreground</key>
           <string>#31748f</string>
          </dict>
         </dict>
         <dict>
          <key>name</key>
          <string>Storage modifier</string>
          <key>scope</key>
          <string>storage.modifier</string>
          <key>settings</key>
          <dict>
           <key>foreground</key>
           <string>#e0def4</string>
          </dict>
         </dict>
         <dict>
          <key>name</key>
          <string>Class</string>
          <key>scope</key>
          <string>keyword.control.class, entity.name, entity.name.class, entity.name.type.class</string>
          <key>settings</key>
          <dict>
           <key>foreground</key>
           <string>#f6c177</string>
          </dict>
         </dict>
         <dict>
          <key>name</key>
          <string>Inherited Class</string>
          <key>scope</key>
          <string>entity.other.inherited-class</string>
          <key>settings</key>
          <dict>
           <key>foreground</key>
           <string>#c4a7e7</string>
          </dict>
         </dict>
         <dict>
          <key>name</key>
          <string>Attribute</string>
          <key>scope</key>
          <string>entity.other.attribute-name</string>
          <key>settings</key>
          <dict>
           <key>foreground</key>
           <string>#f6c177</string>
          </dict>
         </dict>
         <dict>
          <key>name</key>
          <string>Library class</string>
          <key>scope</key>
          <string>support, support.type, support.class</string>
          <key>settings</key>
          <dict>
           <key>foreground</key>
           <string>#31748f</string>
          </dict>
         </dict>
         <dict>
          <key>name</key>
          <string>Function name</string>
          <key>scope</key>
          <string>entity.name.function</string>
          <key>settings</key>
          <dict>
           <key>foreground</key>
           <string>#f6c177</string>
          </dict>
         </dict>
         <dict>
          <key>name</key>
          <string>Variable start</string>
          <key>scope</key>
          <string>punctuation.definition.variable</string>
          <key>settings</key>
          <dict>
           <key>foreground</key>
           <string>#31748f</string>
          </dict>
         </dict>
         <dict>
          <key>name</key>
          <string>Built-in constant</string>
          <key>scope</key>
          <string>constant, constant.language, meta.preprocessor</string>
          <key>settings</key>
          <dict>
           <key>foreground</key>
           <string>#f6c177</string>
          </dict>
         </dict>
         <dict>
          <key>Name</key>
          <string>Section heading</string>
          <key>scope</key>
          <string>entity.name.section</string>
          <key>settings</key>
          <dict>
           <key>foreground</key>
           <string>#ebbcba</string>
          </dict>
         </dict>
         <dict>
          <key>name</key>
          <string>Support.construct</string>
          <key>scope</key>
          <string>support.function.construct, keyword.other.new</string>
          <key>settings</key>
          <dict>
           <key>foreground</key>
           <string>#eb6f92</string>
          </dict>
         </dict>
         <dict>
          <key>name</key>
          <string>User-defined constant</string>
          <key>scope</key>
          <string>constant.character, constant.other</string>
          <key>settings</key>
          <dict>
           <key>foreground</key>
           <string>#ebbcba</string>
          </dict>
         </dict>
         <dict>
          <key>name</key>
          <string>Tag name</string>
          <key>scope</key>
          <string>entity.name.tag</string>
          <key>settings</key>
          <dict>
           <key>foreground</key>
           <string>#c4a7e7</string>
          </dict>
         </dict>
         <dict>
          <key>name</key>
          <string>Tag start/end</string>
          <key>scope</key>
          <string>punctuation.definition.tag.html, punctuation.definition.tag.begin, punctuation.definition.tag.end</string>
          <key>settings</key>
          <dict>
           <key>foreground</key>
           <string>#6e6a86</string>
          </dict>
         </dict>
         <dict>
          <key>name</key>
          <string>Library function</string>
          <key>scope</key>
          <string>support.function</string>
          <key>settings</key>
          <dict>
           <key>foreground</key>
           <string>#31748f</string>
          </dict>
         </dict>
         <dict>
          <key>name</key>
          <string>Continuation</string>
          <key>scope</key>
          <string>punctuation.separator.continuation</string>
          <key>settings</key>
          <dict>
           <key>foreground</key>
           <string>#eb6f92</string>
          </dict>
         </dict>
         <dict>
          <key>name</key>
          <string>Storage Type</string>
          <key>scope</key>
          <string>storage.type</string>
          <key>settings</key>
          <dict>
           <key>foreground</key>
           <string>#c4a7e7</string>
          </dict>
         </dict>
         <dict>
          <key>name</key>
          <string>Exception</string>
          <key>scope</key>
          <string>support.type.exception</string>
          <key>settings</key>
          <dict>
           <key>foreground</key>
           <string>#ebbcba</string>
          </dict>
         </dict>
         <dict>
          <key>name</key>
          <string>Special</string>
          <key>scope</key>
          <string>keyword.other.special-method</string>
          <key>settings</key>
          <dict>
           <key>foreground</key>
           <string>#ebbcba</string>
          </dict>
         </dict>
         <dict>
          <key>name</key>
          <string>Invalid</string>
          <key>scope</key>
          <string>invalid</string>
          <key>settings</key>
          <dict>
           <key>background</key>
           <string>#26233a</string>
          </dict>
         </dict>
         <dict>
          <key>name</key>
          <string>Quoted String</string>
          <key>scope</key>
          <string>string.quoted.double, string.quoted.single</string>
          <key>settings</key>
          <dict>
           <key>foreground</key>
           <string>#9ccfd8</string>
          </dict>
         </dict>
         <dict>
          <key>name</key>
          <string>Quotes</string>
          <key>scope</key>
          <string>punctuation.definition.string</string>
          <key>settings</key>
          <dict>
           <key>foreground</key>
           <string>#e0def4</string>
          </dict>
         </dict>
         <dict>
          <key>name</key>
          <string>[]</string>
          <key>scope</key>
          <string>meta.brace.square, punctuation.section.brackets</string>
          <key>settings</key>
          <dict>
           <key>foreground</key>
           <string>#c4a7e7</string>
          </dict>
         </dict>
         <dict>
          <key>name</key>
          <string>(),{}</string>
          <key>scope</key>
          <string>meta.brace.round, meta.brace.curly, punctuation.section, punctuation.section.block, punctuation.definition.parameters, punctuation.section.group</string>
          <key>settings</key>
          <dict>
           <key>foreground</key>
           <string>#908caa</string>
          </dict>
         </dict>
      <!-- Specifics -->
      <!-- CSS -->
         <dict>
          <key>name</key>
          <string>CSS: Standard color value</string>
          <key>scope</key>
          <string>support.constant.color, invalid.deprecated.color.w3c-non-standard-color-name.scss</string>
          <key>settings</key>
          <dict>
           <key>foreground</key>
           <string>#f6c177</string>
          </dict>
         </dict>
         <dict>
          <key>name</key>
          <string>CSS: Selector > [] and non-spec tags</string>
          <key>scope</key>
          <string>meta.selector.css</string>
          <key>settings</key>
          <dict>
           <key>foreground</key>
           <string>#908caa</string>
          </dict>
         </dict>
         <dict>
          <key>name</key>
          <string>CSS: Tag</string>
          <key>scope</key>
          <string>entity.name.tag.css, entity.name.tag.scss, source.less keyword.control.html.elements, source.sass keyword.control.untitled</string>
          <key>settings</key>
          <dict>
           <key>foreground</key>
           <string>#f6c177</string>
          </dict>
         </dict>
         <dict>
          <key>name</key>
          <string>CSS .class</string>
          <key>scope</key>
          <string>entity.other.attribute-name.class</string>
          <key>settings</key>
          <dict>
           <key>foreground</key>
           <string>#f6c177</string>
          </dict>
         </dict>
         <dict>
          <key>name</key>
          <string>CSS: #id</string>
          <key>scope</key>
          <string>entity.other.attribute-name.id</string>
          <key>settings</key>
          <dict>
           <key>foreground</key>
           <string>#f6c177</string>
          </dict>
         </dict>
         <dict>
          <key>name</key>
          <string>CSS :pseudo</string>
          <key>scope</key>
          <string>entity.other.attribute-name.pseudo-element, entity.other.attribute-name.tag.pseudo-element, entity.other.attribute-name.pseudo-class, entity.other.attribute-name.tag.pseudo-class</string>
          <key>settings</key>
          <dict>
           <key>foreground</key>
           <string>#c4a7e7</string>
          </dict>
         </dict>
      <!-- HTML -->
         <dict>
          <key>name</key>
          <string>HTML: =</string>
          <key>scope</key>
          <string>text.html.basic meta.tag.other.html, text.html.basic meta.tag.any.html, text.html.basic meta.tag.block.any, text.html.basic meta.tag.inline.any, text.html.basic meta.tag.structure.any.html, text.html.basic source.js.embedded.html, punctuation.separator.key-value.html</string>
          <key>settings</key>
          <dict>
           <key>foreground</key>
           <string>#908caa</string>
          </dict>
         </dict>
         <dict>
          <key>name</key>
          <string>HTML: something=</string>
          <key>scope</key>
          <string>text.html.basic entity.other.attribute-name.html, meta.tag.xml entity.other.attribute-name</string>
          <key>settings</key>
          <dict>
           <key>foreground</key>
           <string>#f6c177</string>
          </dict>
         </dict>
      <!-- Ruby -->
         <dict>
          <key>name</key>
          <string>Ruby: Special Method</string>
          <key>scope</key>
          <string>keyword.other.special-method.ruby</string>
          <key>settings</key>
          <dict>
           <key>foreground</key>
           <string>#31748f</string>
          </dict>
         </dict>
         <dict>
          <key>name</key>
          <string>Ruby: Constant Other</string>
          <key>scope</key>
          <string>variable.other.constant.ruby</string>
          <key>settings</key>
          <dict>
           <key>foreground</key>
           <string>#f6c177</string>
          </dict>
         </dict>
         <dict>
          <key>name</key>
          <string>Ruby: :symbol</string>
          <key>scope</key>
          <string>constant.other.symbol.ruby</string>
          <key>settings</key>
          <dict>
           <key>foreground</key>
           <string>#9ccfd8</string>
          </dict>
         </dict>
         <dict>
          <key>name</key>
          <string>Ruby: Special Method</string>
          <key>scope</key>
          <string>keyword.other.special-method.ruby</string>
          <key>settings</key>
          <dict>
           <key>foreground</key>
           <string>#ebbcba</string>
          </dict>
         </dict>
      <!-- PHP -->
         <dict>
          <key>name</key>
          <string>PHP: Array()</string>
          <key>scope</key>
          <string>meta.array support.function.construct.php</string>
          <key>settings</key>
          <dict>
           <key>foreground</key>
           <string>#f6c177</string>
          </dict>
         </dict>
      <!-- C -->
         <dict>
          <key>name</key>
          <string>C: Preprocessor</string>
          <key>scope</key>
          <string>entity.name.function.preprocessor.c, meta.preprocessor.c.include, meta.preprocessor.macro.c</string>
          <key>settings</key>
          <dict>
           <key>foreground</key>
           <string>#ebbcba</string>
          </dict>
         </dict>
         <dict>
          <key>name</key>
          <string>C: include</string>
          <key>scope</key>
          <string>meta.preprocessor.c.include string.quoted.other.lt-gt.include.c, meta.preprocessor.c.include punctuation.definition.string.begin.c, meta.preprocessor.c.include punctuation.definition.string.end.c</string>
          <key>settings</key>
          <dict>
           <key>foreground</key>
           <string>#9ccfd8</string>
          </dict>
         </dict>
      <!-- Other (?) -->
         <dict>
          <key>name</key>
          <string>Other: Removal</string>
          <key>scope</key>
          <string>other.package.exclude, other.remove</string>
          <key>settings</key>
          <dict>
           <key>foreground</key>
           <string>#eb6f92</string>
          </dict>
         </dict>
         <dict>
          <key>name</key>
          <string>Other: Add</string>
          <key>scope</key>
          <string>other.add</string>
          <key>settings</key>
          <dict>
           <key>foreground</key>
           <string>#9ccfd8</string>
          </dict>
         </dict>
      <!-- Tex -->
         <dict>
          <key>name</key>
          <string>Tex: {}</string>
          <key>scope</key>
          <string>punctuation.section.group.tex , punctuation.definition.arguments.begin.latex, punctuation.definition.arguments.end.latex, punctuation.definition.arguments.latex</string>
          <key>settings</key>
          <dict>
           <key>foreground</key>
           <string>#eb6f92</string>
          </dict>
         </dict>
         <dict>
          <key>name</key>
          <string>Tex: {text}</string>
          <key>scope</key>
          <string>meta.group.braces.tex</string>
          <key>settings</key>
          <dict>
           <key>foreground</key>
           <string>#f6c177</string>
          </dict>
         </dict>
         <dict>
          <key>name</key>
          <string>Tex: Other Math</string>
          <key>scope</key>
          <string>string.other.math.tex</string>
          <key>settings</key>
          <dict>
           <key>foreground</key>
           <string>#f6c177</string>
          </dict>
         </dict>
         <dict>
          <key>name</key>
          <string>Tex: {var}</string>
          <key>scope</key>
          <string>variable.parameter.function.latex</string>
          <key>settings</key>
          <dict>
           <key>foreground</key>
           <string>#ebbcba</string>
          </dict>
         </dict>
         <dict>
          <key>name</key>
          <string>Tex: Math \\</string>
          <key>scope</key>
          <string>punctuation.definition.constant.math.tex</string>
          <key>settings</key>
          <dict>
           <key>foreground</key>
           <string>#eb6f92</string>
          </dict>
         </dict>
         <dict>
          <key>name</key>
          <string>Tex: Constant Math</string>
          <key>scope</key>
          <string>text.tex.latex constant.other.math.tex, constant.other.general.math.tex, constant.other.general.math.tex, constant.character.math.tex</string>
          <key>settings</key>
          <dict>
           <key>foreground</key>
           <string>#9ccfd8</string>
          </dict>
         </dict>
         <dict>
          <key>name</key>
          <string>Tex: Other Math String</string>
          <key>scope</key>
          <string>string.other.math.tex</string>
          <key>settings</key>
          <dict>
           <key>foreground</key>
           <string>#f6c177</string>
          </dict>
         </dict>
         <dict>
          <key>name</key>
          <string>Tex: $</string>
          <key>scope</key>
          <string>punctuation.definition.string.begin.tex, punctuation.definition.string.end.tex</string>
          <key>settings</key>
          <dict>
           <key>foreground</key>
           <string>#eb6f92</string>
          </dict>
         </dict>
         <dict>
          <key>name</key>
          <string>Tex: \label</string>
          <key>scope</key>
          <string>keyword.control.label.latex, text.tex.latex constant.other.general.math.tex</string>
          <key>settings</key>
          <dict>
           <key>foreground</key>
           <string>#9ccfd8</string>
          </dict>
         </dict>
         <dict>
          <key>name</key>
          <string>Tex: \label { }</string>
          <key>scope</key>
          <string>variable.parameter.definition.label.latex</string>
          <key>settings</key>
          <dict>
           <key>foreground</key>
           <string>#eb6f92</string>
          </dict>
         </dict>
         <dict>
          <key>name</key>
          <string>Tex: Function</string>
          <key>scope</key>
          <string>support.function.be.latex</string>
          <key>settings</key>
          <dict>
           <key>foreground</key>
           <string>#31748f</string>
          </dict>
         </dict>
         <dict>
          <key>name</key>
          <string>Tex: Support Function Section</string>
          <key>scope</key>
          <string>support.function.section.latex</string>
          <key>settings</key>
          <dict>
           <key>foreground</key>
           <string>#ebbcba</string>
          </dict>
         </dict>
         <dict>
          <key>name</key>
          <string>Tex: Support Function</string>
          <key>scope</key>
          <string>support.function.general.tex</string>
          <key>settings</key>
          <dict>
           <key>foreground</key>
           <string>#9ccfd8</string>
          </dict>
         </dict>
         <dict>
          <key>name</key>
          <string>Tex: Reference Label</string>
          <key>scope</key>
          <string>keyword.control.ref.latex</string>
          <key>settings</key>
          <dict>
           <key>foreground</key>
           <string>#9ccfd8</string>
          </dict>
         </dict>
      <!-- Python -->
         <dict>
          <key>name</key>
          <string>Python: storage</string>
          <key>scope</key>
          <string>storage.type.class.python, storage.type.function.python, storage.modifier.global.python</string>
          <key>settings</key>
          <dict>
           <key>foreground</key>
           <string>#31748f</string>
          </dict>
         </dict>
         <dict>
          <key>name</key>
          <string>Python: Support.exception</string>
          <key>scope</key>
          <string>support.type.exception.python</string>
          <key>settings</key>
          <dict>
           <key>foreground</key>
           <string>#f6c177</string>
          </dict>
         </dict>
      <!-- Shell -->
         <dict>
          <key>name</key>
          <string>Shell: meta scope in loop</string>
          <key>scope</key>
          <string>meta.scope.for-in-loop.shell, variable.other.loop.shell</string>
          <key>settings</key>
          <dict>
           <key>foreground</key>
           <string>#e0def4</string>
          </dict>
         </dict>
         <dict>
          <key>name</key>
          <string>Shell: Meta Block</string>
          <key>scope</key>
          <string>meta.scope.case-block.shell, meta.scope.case-body.shell</string>
          <key>settings</key>
          <dict>
           <key>foreground</key>
           <string>#e0def4</string>
          </dict>
         </dict>
         <dict>
          <key>name</key>
          <string>Shell: []</string>
          <key>scope</key>
          <string>punctuation.definition.logical-expression.shell</string>
          <key>settings</key>
          <dict>
           <key>foreground</key>
           <string>#eb6f92</string>
          </dict>
         </dict>
      <!-- C++ -->
         <dict>
          <key>name</key>
          <string>Storage</string>
          <key>scope</key>
          <string>storage.modifier.c++</string>
          <key>settings</key>
          <dict>
           <key>foreground</key>
           <string>#31748f</string>
          </dict>
         </dict>
      <!-- Perl -->
         <dict>
          <key>name</key>
          <string>Perl: functions</string>
          <key>scope</key>
          <string>support.function.perl</string>
          <key>settings</key>
          <dict>
           <key>foreground</key>
           <string>#c4a7e7</string>
          </dict>
         </dict>
      <!-- Diff -->
         <dict>
          <key>name</key>
          <string>diff: header</string>
          <key>scope</key>
          <string>meta.diff, meta.diff.header</string>
          <key>settings</key>
          <dict>
           <key>foreground</key>
           <string>#6e6a86</string>
          </dict>
         </dict>
         <dict>
          <key>name</key>
          <string>diff: range</string>
          <key>scope</key>
          <string>meta.diff.range</string>
          <key>settings</key>
          <dict>
           <key>foreground</key>
           <string>#c4a7e7</string>
          </dict>
         </dict>
         <dict>
          <key>name</key>
          <string>diff: deleted</string>
          <key>scope</key>
          <string>markup.deleted</string>
          <key>settings</key>
          <dict>
           <key>foreground</key>
           <string>#eb6f92</string>
          </dict>
         </dict>
         <dict>
          <key>name</key>
          <string>diff: changed</string>
          <key>scope</key>
          <string>markup.changed</string>
          <key>settings</key>
          <dict>
           <key>foreground</key>
           <string>#f6c177</string>
          </dict>
         </dict>
         <dict>
          <key>name</key>
          <string>diff: inserted</string>
          <key>scope</key>
          <string>markup.inserted</string>
          <key>settings</key>
          <dict>
           <key>foreground</key>
           <string>#31748f</string>
          </dict>
         </dict>
         <dict>
          <key>name</key>
          <string>Warning</string>
          <key>scope</key>
          <string>markup.warning</string>
          <key>settings</key>
          <dict>
           <key>foreground</key>
           <string>#f6c177</string>
          </dict>
         </dict>
         <dict>
          <key>name</key>
          <string>Error</string>
          <key>scope</key>
          <string>markup.error</string>
          <key>settings</key>
          <dict>
           <key>foreground</key>
           <string>#eb6f92</string>
          </dict>
         </dict>
      <!-- Markdown -->
         <dict>
          <key>Name</key>
          <string>Markdown heading</string>
          <key>scope</key>
          <string>markup.heading, punctuation.definition.heading.markdown</string>
          <key>settings</key>
          <dict>
           <key>foreground</key>
           <string>#f6c177</string>
           <key>fontStyle</key>
           <string>bold</string>
          </dict>
         </dict>
         <dict>
          <key>name</key>
          <string>Markdown quote</string>
          <key>scope</key>
          <string>markup.quote</string>
          <key>settings</key>
          <dict>
           <key>foreground</key>
           <string>#31748f</string>
          </dict>
         </dict>
         <dict>
          <key>name</key>
          <string>Markdown em</string>
          <key>scope</key>
          <string>markup.italic</string>
          <key>settings</key>
          <dict>
           <key>fontStyle</key>
           <string>italic</string>
          </dict>
         </dict>
         <dict>
          <key>Name</key>
          <string>Markdown strong</string>
          <key>scope</key>
          <string>markup.bold</string>
          <key>settings</key>
          <dict>
           <key>fontStyle</key>
           <string>bold</string>
          </dict>
         </dict>
         <dict>
          <key>Name</key>
          <string>Markdown reference</string>
          <key>scope</key>
          <string>markup.underline.link.markdown, meta.link.reference constant.other.reference.link.markdown</string>
          <key>settings</key>
          <dict>
           <key>foreground</key>
           <string>#9ccfd8</string>
          </dict>
         </dict>
         <dict>
          <key>Name</key>
          <string>Markdown reference list</string>
          <key>scope</key>
          <string>constant.other.reference.link.markdown</string>
          <key>settings</key>
          <dict>
           <key>foreground</key>
           <string>#6c71c4</string>
          </dict>
         </dict>
         <dict>
          <key>Name</key>
          <string>Markdown linebreak</string>
          <key>scope</key>
          <string>meta.paragraph.markdown meta.dummy.line-break</string>
          <key>settings</key>
          <dict>
           <key>background</key>
           <string>#6e6a86</string>
          </dict>
         </dict>
      <!-- Sublime Bracket Highlighter -->
         <dict>
          <key>name</key>
          <string>SublimeBracketHighlighter</string>
          <key>scope</key>
          <string>brackethighlighter.all</string>
          <key>settings</key>
          <dict>
           <key>foreground</key>
           <string>#6e6a86</string>
          </dict>
         </dict>
      <!-- Find In Files -->
         <dict>
          <key>name</key>
          <string>Find In Files: File Name</string>
          <key>scope</key>
          <string>entity.name.filename.find-in-files</string>
          <key>settings</key>
          <dict>
           <key>foreground</key>
           <string>#9ccfd8</string>
          </dict>
         </dict>
         <dict>
          <key>name</key>
          <string>Find In Files: Line numbers</string>
          <key>scope</key>
          <string>constant.numeric.line-number.find-in-files</string>
          <key>settings</key>
          <dict>
           <key>foreground</key>
           <string>#6e6a86</string>
          </dict>
         </dict>
      <!-- JavaScript and Babel/ES2015 -->
         <dict>
          <key>name</key>
          <string>JavaScript Variables</string>
          <key>scope</key>
          <string>variable.other.readwrite.js, variable.other.object.js, variable.other.constant.js</string>
          <key>settings</key>
          <dict>
           <key>foreground</key>
           <string>#e0def4</string>
          </dict>
         </dict>
        </array>
        <key>uuid</key>
        <string>5815b34d-fb7d-4593-bf0c-4f41f8b1f0a9</string>
       </dict>
      </plist>
    '';
}
