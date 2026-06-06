inputs_load();

var _strFin = textArray[textPage].text;
var _strLen = string_length(_strFin);
if l < _strLen+1 l += textArray[textPage].typeSpeed;
    
if key_nextDiag{
    l = 0;
    textPage++;
}

if textPage > array_length(textArray)-1 instance_destroy();
    
x = mouse_x//speaker.x - 64;
y = mouse_y//speaker.y - 64;