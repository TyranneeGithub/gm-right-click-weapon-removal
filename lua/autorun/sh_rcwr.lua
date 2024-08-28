/* For further info on how does this addon works, the GLua Enhanced extension allows you to read in full detail what each function does as well as pointing you to the Wiki page the info comes from. */
/* This was a massive help for me when messing around with lua. A lot of Wiki pages also show example code which is useful for showing you the many applications a function can be used... */


/* This hook is for player input. Runs every time a player presses a key ( p = player, b = button that is pressed ) */
hook.Add( "PlayerButtonDown", "DestroyWeapon", function( p, b )


    /* Get the player and see if they are holding down the +use key ( IN_USE ) and right mouse button ( MOUSE_RIGHT ). It's also convenient to make sure the player has at least one weapon to remove */
    /* Note: 'IN_' enums refer to a default player action which can have their binds changed (jumping, ducking, etc.). KEY_, MOUSE_, and JOYSTICK_ (to a lesser extent) is better if you don't want the bind changed */
    if p:KeyDown( IN_USE ) && b == MOUSE_RIGHT && #p:GetWeapons() > 0 then


        /* Get the player's active weapon if they have one */
        local w = p:GetActiveWeapon();

        if w != NULL then


            /* Strip away the selected weapon from the player by giving 'p:StripWeapon' the name of the weapon itself which we can get from 'w:GetClass()' */
            p:StripWeapon( w:GetClass() );


            /* Just prints a message to the console. Pretty useful if your friends are trying to be sneaky with overpowered TFA weapons */
            MsgC( Color( 255, 255, 255 ), "Removed " .. w:GetClass() .. " from " .. p:Nick() .. "\n" );
        end
    end
end );


/* Disables the default tools the player gets in sandbox (physgun, camera, etc.) so you don't need to delete them every time you spawn. Trust me, 98% of players will install a mod to remove them */
hook.Add( "PlayerLoadout", "DisableDefaultWeapons", function( p )

	return true;
end );