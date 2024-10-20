## **_Basic HTML:_**

- (`)html` extension to make PC aware of HTML syntax
- `HTML` - Hyper-Text Markup Language

### **_HTML Tags:_**

> use tag -> start tag `< >` and end tag `</ >`

- `html` - root element
- `head` - metadata
  - `meta` - metadata
  - `favicon` - icon
  - `link` - external stylesheet
  - `title` - title of the page
- `body` - content of the page
  - `footer` - bottom of the page

### **HTML Text tag:**

#### **(1) Inline tag -> in a line - do not change line**

- `<b> </b>`

  - bold tag: used for make text bold

- `<i> </i>`
  - italic tag: used for make text italic

**_Semantic:_** Meaningful
semantic tag:

- `<strong>` `</strong>`

  - strong tag: used for make important text bold

- `<em>` `</em>`

  - emphasis tag: used for make text italic

- `<small>` `</small>`

  - small tag: used for make text small

- `span`

#### **(2) Block Tag -> used for make text block level - starts with new line**

- `<p>` this is a para `</p>`

  - paragraph tag: used for make para for website pages
  - no line gap

- `<h1>` `</h1>` to `<h6>` `</h6>`

  - heading tag: used for make heading for website pages

### **HTML List tag:**

**Container tag:**

- `<ul>` `</ul>` - unordered list tag: used for make unordered list

  - `<li>` `</li>` - list item tag: used for make list item
  - symbol is used

- `<ol>` `</ol>` - ordered list tag: used for make ordered list

  - `<li>` `</li>` - list item tag: used for make list item
  - numbering used
    > **Note:** `ol` is used for ordered list and `ul` is used for unordered list. can be nested

- `<div>` `</div>`

  - division tag: used for make block level container

- `<span>` inline container `</span>`
  - span tag: used for make inline level container
- `<br>`
  - line break: self closing tag

**Anchor, img tag**

- `<a>` `</a>`

  - anchor tag: used for make link.
  - `target` attribute: used for open link in new tab. `_blank`

- `<img/>`-self-closing used instead of this `<img>` `</img>`-void tag since no need to write inside this tag
  - image tag: used for show image from the reference. self-closing tag
  - `src` attribute: used for specify image source
  - `alt` attribute: used for specify image alternative text
  - `srcset` attribute: used for specify image source for different screen size

**HTML Form: for user input**

- `<form>` `</form>`
- form tag: used for make form
- `<input/>`
- input tag: used for get user input with various type
- `type` attribute: used for specify input type
- `placeholder` attribute: used for specify input placeholder text - to show user what to input
