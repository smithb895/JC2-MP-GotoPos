
class 'gotoPos'

function gotoPos:__init()
    self.active = true

    Events:Subscribe( "ModuleLoad", self, self.ModulesLoad )
    Events:Subscribe( "ModulesLoad", self, self.ModulesLoad )
    Events:Subscribe( "ModuleUnload", self, self.ModuleUnload )
end


function gotoPos:ModulesLoad()
    Events:FireRegisteredEvent( "HelpAddItem",
        {
            name = "Goto Pos",
            text = 
                "Teleport to x,y,z coordinates.  The required format is different than what you\nsee on your in-game map.  To convert in-game map coords to script\nformat, subtract 16384 from the x and y coordinates in-game.  The in-game\nY-coord translates to z-coord.  For example, the \nEmas Hitam Oil Refinery, located at in-game map coords X:27960, Y:7010 would be\n11576,1500,-9374. With 1500 being the height at which it will tp you.\n\n" ..
                "Usage: /gotopos x,y,z\n\n" ..
				"Example: /gotopos -4324,499,6872"
        } )
end

function gotoPos:ModuleUnload()
    Events:FireRegisteredEvent( "HelpRemoveItem",
        {
            name = "Goto Pos"
        } )
end



local gotopos = gotoPos()
