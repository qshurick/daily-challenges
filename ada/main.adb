with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings; use Ada.Strings;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Frugal; use Frugal;

procedure Main is
    Bottle : Wine;
    SingleBottle : Wine := (To_Unbounded_String("Wine A"), 8.99);
    EmptyCollection : WineCollection := (1 .. 0 => <>);
    Bottles : WineCollection(1 .. 3) := ( 
        SingleBottle, 
        (To_Unbounded_String("Wine 32"), 13.99), 
        (To_Unbounded_String("Wine 9"), 10.99));
begin
    ChooseWine((1 .. 0 => <>), Bottle);
    Put_Line("Testing...");
    Put_Line(To_String(Bottle.Label));

    ChooseWine((1 => SingleBottle), Bottle);
    Put_Line("Testing...");
    Put_Line(To_String(Bottle.Label));

    ChooseWine(Bottles, Bottle);
    Put_Line("Testing...");
    Put_Line(To_String(Bottle.Label));
end Main;
