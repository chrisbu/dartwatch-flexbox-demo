#import('dart:html');
#resource('flexbox.css');

void main() {
  //get the body element
  BodyElement body = document.body;  
  
  //create a div to encompas the whole page.  
  //This will be part of the body flexbox model, horizontal align.
  DivElement page = createDiv("page");
  
  body.nodes.add(page);
  
  /*the #page itself defines itself as a flexbox parent (as well as being a 
    child of body flexbox), with vertical align.  
   */ 
  
  //add a header to the page.
  var header = new Element.tag("header");
  header.innerHTML += "Header<br/>";
  page.nodes.add(header);
  
  //create a #center div which will dynamically resize.
  /*the #center div is also a flexbox parent (as well as a child of page)
    which defines itself as having horizontal align
  */
  var center = createDiv("center");
  /* add a left and right pane to the center.  As they are children of the
    #center div, they will be horizontally aligned.
  */   
  var left = createDiv("left","Left Pane");
  var right = createDiv("right", "Right Pane<br/>");    
  center.nodes.add(left);
  center.nodes.add(right);
  
  //add the #center div to the page.
  page.nodes.add(center);
    
  //create a footer and add it to the page.
  var footer = new Element.tag("footer");
  footer.innerHTML += "Footer";
  page.nodes.add(footer);
  
  //we're done.
  
  
  //but just for fun, lets add some content .
  addMockApplicationContent(header,right);
  
}




/**
* utility function to create a div with the [id] and optionally
* some inner html set with [text]
*/
DivElement createDiv(String id, [String text = null]) {
  var div = new Element.tag("div");
  div.id = id;
  if (text != null) {
    div.innerHTML += text;
  }
  
  return div;
}





addMockApplicationContent(header,right) {
  /* I don't care about layout here
     but in a real application, we'd probably use more flexbox to lay
     out the elements in relation to eachother. */
  InputElement input = new Element.tag("input");
  input.value="edit me or click button";
  header.nodes.add(input);
  
  ButtonElement button = new Element.tag("button");
  button.text = "click me";
  header.nodes.add(button);
  
  
  TextAreaElement textArea = new Element.tag("textarea");
  textArea.rows = 10;
  textArea.cols = 50;
  right.nodes.add(textArea);
  
  button.on.click.add((event) {
    textArea.value += input.value + "\n";
  });
  
}
