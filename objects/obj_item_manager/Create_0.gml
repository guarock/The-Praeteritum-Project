//depth = -9999

////create the constructor
//function create_item( _name, _desc, _spr, _can_drop, _effect) constructor
//	{
//	name = _name
//	description = _desc
//	sprite = _spr
//	can_drop =_can_drop
//	effect = _effect
//	}	

//// create the item

//global.item_list = 
//{
//	burger : new create_item(
//		"Burger",
//		"recovers HP",
//		spr_burger,
//		true,
	
//		function()
//		{
//			//get rid of the item
//			array_delete(inv, selected_item, 1)
//		}
//		),
		
//	bomb : new create_item( 
//		"Bomb",
//		"big boom!",
//		spr_bomb,
//		true,
//		function()
//		{
//			//get rid of the item
//			array_delete(inv, selected_item, 1)
//		}
//		),
		
//	redkey : new create_item(
//		"Red Key",
//		"opens red doors (Single Use)",
//		spr_redkey,
//		false,
//		function()
//		{
//			var _used = false
			
//			if instance_exists(obj_red_door)
//			{
//				with(obj_red_door)
//				{
//					if distance_to_object(obj_player) < 20
//						{
//						instance_destroy();
//						_used = true
//						};
					
//				}
//			}
		
//			//get rid of the item
//			if _used == true
//			array_delete(inv, selected_item, 1)
//		}
		
//		),
		 
		 
//	greenkey : new create_item(
//		"Green Key",
//		"opens green doors (Unlimited Use)",
//		spr_greenkey,
//		false,
//		function()
//		{
//			var _used = false
			
//			if instance_exists(obj_green_door)
//			{
//				with(obj_green_door)
//				{
//					if distance_to_object(obj_player) < 20 
//					{instance_destroy();
//					_used = true
//					};
					
//				}
//			}		
//		}
//		),
		
//		bluekey : new create_item(
//		"Blue Key",
//		"opens blue doors (Single Use)",
//		spr_bluekey,
//		false,
//		function()
//		{
//			var _used = false
			
//			if instance_exists(obj_blue_door)
//			{
//				with(obj_blue_door)
//				{
//					if distance_to_object(obj_player) < 20 {
//						instance_destroy();
//						_used = true
//						};
					
//				}
//			}	
			
//				//get rid of the item
//				if _used == true
//			array_delete(inv, selected_item, 1)
//		}
//		),
		
//		greykey : new create_item
//		(
//		"Grey Key",
//		"Open grey doors (Unlimited Use)",
//		spr_greykey,
//		false,
//		function()
//		{
//		var _used = false
		
//		if instance_exists(obj_grey_door1) && instance_exists(obj_grey_door2)
//			{
//			with (obj_grey_door1)
//			{
//				if distance_to_object(obj_player) < 20 {
//				instance_destroy();
//				_used = true
//				}
//			}		
//			with(obj_grey_door2)
//			{
//			if distance_to_object(obj_player) < 20 {
//			instance_destroy();
//			_used = true
//			}
			
//			}
		
//		}
		
//		}		
		
//		),
	
		
		
//}
////create the inventory
//inv = array_create(0);

//selected_item = -1;
	
	
////for drawing and mouse positions
//sep = 16
