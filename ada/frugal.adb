with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

package body Frugal is

    procedure ChooseWine 
    (Wine_Collection : in WineCollection;
     ChosenWine      : out Wine)
    is
        Cheapest : Wine;
        
        procedure InitiateWineBottles
        (FistBottle     : in Wine;
         SecondBottle   : in Wine;
         CheapestBottle : out Wine;
         ChosenBottle   : out Wine)
        is
        begin
            if FistBottle.Price < SecondBottle.Price then
                ChosenBottle   := SecondBottle;
                CheapestBottle := FistBottle;
            else
                ChosenBottle   := FistBottle;
                CheapestBottle := SecondBottle;
            end if;
        end InitiateWineBottles;
        
        procedure SelectTwoCheapest
        (CurrentBottle  : in Wine;
         CheapestBottle : in out Wine;
         ChosenBottle   : in out Wine)
        is
        begin
            if CurrentBottle.Price < Cheapest.Price then
                ChosenWine := Cheapest;
                Cheapest   := CurrentBottle;
            elsif CurrentBottle.Price < ChosenWine.Price then
                ChosenWine := CurrentBottle;
            end if;
        end SelectTwoCheapest;
         
    begin
        if Wine_Collection'length = 1 then
            ChosenWine := Wine_Collection(1);
        elsif Wine_Collection'length > 2 then
            InitiateWineBottles(Wine_Collection(1), Wine_Collection(2), Cheapest, ChosenWine);
            for Index in 3 .. Wine_Collection'length loop
                SelectTwoCheapest(Wine_Collection(Index), Cheapest, ChosenWine);
            end loop;
        end if;
    end ChooseWine;

end Frugal;
