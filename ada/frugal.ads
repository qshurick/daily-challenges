with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

package Frugal is

    type Wine is record
        Label : Unbounded_String;
        Price : Float;
    end record;

    type WineCollection is array (Positive range <>) of Wine;

    procedure ChooseWine 
    (Wine_Collection : in WineCollection;
     ChosenWine      : out Wine);

end Frugal;
