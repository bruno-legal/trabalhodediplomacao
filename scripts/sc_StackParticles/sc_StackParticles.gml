function particle_billboard_create(_struct,_ammount){
    repeat (_ammount) {
        var _x = irandom_range(_struct.xMin,_struct.xMax);
        var _y = irandom_range(_struct.yMin,_struct.yMax);
        var _part = instance_create_depth(_x,_y,0,opar_StackedParticle);
        
        //Sprite
        _part.sprite_index = _struct.spriteToUse;
        _part.image_index = _struct.imageIndex;
        _part.animate = _struct.animate;
        _part.randomImg = _struct.randomImg;
        _part.loopAnimation = _struct.loopAnimation;
        
        with (_part){
            image_speed = animate;
            if randomImg image_index = irandom_range(0,image_number);
        }
        
        //Color
        _part.col1 = _struct.col1;
        _part.col2 = _struct.col2;
        _part.col3 = _struct.col3;
        
        //Life
        _part.lifeMax = irandom_range(_struct.lifeMin,_struct.lifeMax);
        
        //Scale
        _part.xscale = _struct.xscale;
        _part.yscale = _struct.yscale;
        
        //Size
        _part.size = random_range(_struct.sizeMin,_struct.sizeMax);
        _part.sizeIcr = _struct.sizeIcr;
        
        //Move Speed
        _part.movespeed = random_range(_struct.movespeedMin,_struct.movespeedMax);
        _part.movespeedIcr = _struct.movespeedIcr;
        
        //Gravity
        _part.gravForce = _struct.gravForce;
        
        //Direction
        _part.dir = random_range(_struct.dirMin,_struct.dirMax); 
        _part.dirIcr = _struct.dirIcr;
        
        //Orientation
        _part.ori = random_range(_struct.oriMin,_struct.oriMax);
        _part.oriRelative = _struct.oriRelative;
        
        //Z
        _part.zDir = _struct.zDir;
        _part.zSpeed = random_range(_struct.zSpeedMin,_struct.zSpeedMax);
        _part.zSpeedIcr = _struct.zSpeedIcr;
        _part.z = irandom_range(_struct.zMin,_struct.zMax);
    }
}