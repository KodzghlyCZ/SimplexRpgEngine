#define apiRoomCreation
/// apiRoomCreation()
/*

- roomCreation(camera,controller)
 
  Initialise the room

#define roomCreation
/// roomCreation(camera,controller)
randomize();


camera     = 1;
controller = 1;


if (argument_count > 0) {camera        = argument[0];}
if (argument_count > 1) {controller    = argument[1];}


if (instance_number(oCamera) = 0 && camera = 1)
   {
     instance_create(0,0,oCamera);
   }
if (instance_number(oController) = 0 && controller = 1)
   {
     instance_create(0,0,oController);
   }