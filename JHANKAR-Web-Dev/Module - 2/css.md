## CSS

- Cascading Style Sheet.
- final updated value in css will be shown
  `selector { Property: value }`
- CSS is used to style HTML elements.
  **CSS type:**
- Inline CSS - `style="rule: value;"`
  - on line. separated by clone.
- Internal or Embedded CSS

  - at head portion
  - inside `style tag`

- External CSS
  - in a separate file
  - linked using `link tag`

**CSS Note** - `#idName { rule: value; }` - id selector - `.className { rule: value; }` - class selector - `*{ rule: value; }` - universal selector - `tag { rule: value; }` - tag selector - `tag1, tag2,..{ rule: value; }` - group selector

#### `tag[type="typeName"]{rule: value;}` -> use to specify type

### CSS Unit

- `px` - pixel
- `em` - relative to font size of parent
- `rem` - relative to font size of root element
- `vh` - viewport height
- `vw` - viewport width
- `%` - percentage of parent element

### **CSS Property**

- CSS Box Model{margin, padding, border, height, weight, content}

- `color: value;` - color
- `background-color: value;` - background color
- `font-size: value;` - font size
  <!-- /* Top-Left-Right-Bottom */ for one value -->
  <!-- /* Top-Bottom Left-Right*/ for two value-->
  <!-- /* Top Left-Right Bottom */ for three value-->
  <!-- /* Top Left Right Bottom */ for four value-->
- `margin: value;` - margin size of block
- `padding: value;` - padding size of block
- `border: value;` - border size of block
- `text-align: value;` - center, left, right, justify, initial, inherit, unset
- `text-decoration: value;` - overline, line-through, underline, none, initial, inherit, unset
- `visibility` - hidden, visible, collapse, initial, inherit, unset
  - keeps the space of the element
- `display` - block, inline, inline-block, none, initial, inherit, unset
  - block - takes full width and height. if none then it will be vanish with element space
- `box-shadow` - element shadow in outer side
- `font-family: value;` - font family

- `background-image: url(path.extension);`
<!-- for parent folder access use `../path from parent folder` -->
- `background-repeat: value;` - repeat (,-x, -y), no-repeat, initial, inherit, unset
<!-- background-repeat works with background-image -->
- `background-size: value;` - cover, contain, auto, initial, inherit, unset
- `background-color: value` - background color

- `text-transform: value;` - text transform
- `position: value;` - relative, absolute, fixed, static, initial, inherit, unset
- `width: value;` - width of block
- `height: value;` - height of block
- `background-position: value;` - background position
- `background-attachment: value;` - scroll, fixed, local, initial, inherit,

### Use cases:

- display: block or inline-block
  - works -> width and height
  - display: inline-block - elements remain on the same line but take height width of element block
  - display: block - elements take full width and height as a new block
