function dialog_struct_create(_speaker=id,_skip=true,_textArray=["Test 1","Test 2","Test 3"]){
    diagStruct = {
        speaker : _speaker,
        skip : _skip,
        textArray : _textArray
    }
    return diagStruct;
}

function dialogbox_create(){
}

function dialogbox_destroy(){
}

function dialogbox_text_structure(_text,_color,_typeSpeed) constructor{
    text = _text;
    color = _color;
    typeSpeed = _typeSpeed;
}