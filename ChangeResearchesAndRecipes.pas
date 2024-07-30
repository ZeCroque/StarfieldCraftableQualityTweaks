{
  Automatically rebalance the craft of Starfield Extended - Craftable Quality - Fr
}
unit userscript;

var
  meleeWeaponNames: array [0..7] of string;
  ballisticWeaponNames: array [0..27] of string;
  energyWeaponNames: array [0..9] of string;
  explosiveWeaponNames: array [0..4] of string;
  adhesive, tungsten, caelumite, polymer, spidroin, tantalum, titanium, vanadium, zeroWire, isoMagnet, platinum, iridium, iron, lead, weaponPerk, armorPerk, specialPerk, helmetResearch, backpackResearch, suitResearch, weaponResearch, meleeWeaponResearch : string;
  armorRecipe, meleeWeaponRecipe, ballisticWeaponRecipe, energyWeaponRecipe, explosiveWeaponRecipe: array [0..4] of string;

function Initialize: integer;
begin
  meleeWeaponNames[0] := 'CombatKnife';
  meleeWeaponNames[1] := 'BarrowKnife';
  meleeWeaponNames[2] := 'Cutlass';
  meleeWeaponNames[3] := 'OsmiumKnife';
  meleeWeaponNames[4] := 'PainBlade';
  meleeWeaponNames[5] := 'RescueAxe';
  meleeWeaponNames[6] := 'Wakazashi';
  meleeWeaponNames[7] := 'Tanto';
  
  ballisticWeaponNames[0] := 'Kraken';
  ballisticWeaponNames[1] := 'Eon';
  ballisticWeaponNames[2] := 'MagShot';
  ballisticWeaponNames[3] := 'M1919';
  ballisticWeaponNames[4] := 'Rattler';
  ballisticWeaponNames[5] := 'Razorback';
  ballisticWeaponNames[6] := 'Regulator';
  ballisticWeaponNames[7] := 'Sidestar';
  ballisticWeaponNames[8] := 'UrbanEagle';
  ballisticWeaponNames[9] := 'XM2311';
  ballisticWeaponNames[10] := 'AA99';
  ballisticWeaponNames[11] := 'Beowulf';
  ballisticWeaponNames[12] := 'Drumbeat';
  ballisticWeaponNames[13] := 'Grendel';
  ballisticWeaponNames[14] := 'HardTarget';
  ballisticWeaponNames[15] := 'Kodama';
  ballisticWeaponNames[16] := 'Lawgiver';
  ballisticWeaponNames[17] := 'Maelstrom';
  ballisticWeaponNames[18] := 'MagPulse';
  ballisticWeaponNames[19] := 'MagShear';
  ballisticWeaponNames[20] := 'MagSniper';
  ballisticWeaponNames[21] := 'RussianAssaultRifle';
  ballisticWeaponNames[22] := 'RussianHuntingRifle';
  ballisticWeaponNames[23] := 'Breach';
  ballisticWeaponNames[24] := 'Coachman';
  ballisticWeaponNames[25] := 'Pumpshotgun';
  ballisticWeaponNames[26] := 'Pacifier';
  ballisticWeaponNames[27] := 'Shotty';

  energyWeaponNames[0] := 'Novalight';
  energyWeaponNames[1] := 'Novablast';
  energyWeaponNames[2] := 'Solstice';
  energyWeaponNames[3] := 'Equinox';
  energyWeaponNames[4] := 'InflictorPistol';
  energyWeaponNames[5] := 'InflictorRifle';
  energyWeaponNames[6] := 'Orion';
  energyWeaponNames[7] := 'BigBang';
  energyWeaponNames[8] := 'ArcWelder';
  energyWeaponNames[9] := 'Cutter';

  explosiveWeaponNames[0] := 'AutoRivet';
  explosiveWeaponNames[1] := 'Bridger';
  explosiveWeaponNames[2] := 'MagStorm';
  explosiveWeaponNames[3] := 'Microgun';
  explosiveWeaponNames[4] := 'Rocketlauncher';

  adhesive := '77828';
  tungsten := '57c4';
  caelumite := '252074';
  polymer := '77826';
  spidroin := '777fc';
  tantalum := '57c8';
  titanium := '57c6';
  vanadium := '57ed';
  zeroWire := '24576e';
  isoMagnet := '24578a';
  platinum := '57cc';
  iridium := '57ec';
  iron := '57c7';
  lead := '57c1';
  weaponPerk := '2c890c';
  armorPerk := '27cbc3';
  specialPerk := '4ce2d';
  helmetResearch := '178d1d';
  backpackResearch := 'c11a7';
  suitResearch := '178d1a';
  weaponResearch := '389f21';
  meleeWeaponResearch := '2fb456';

  meleeWeaponRecipe[0] := titanium;
  meleeWeaponRecipe[1] := iron;
  meleeWeaponRecipe[2] := caelumite;
  meleeWeaponRecipe[3] := vanadium;
  meleeWeaponRecipe[4] := tantalum;

  ballisticWeaponRecipe[0] := titanium;
  ballisticWeaponRecipe[1] := adhesive;
  ballisticWeaponRecipe[2] := caelumite;
  ballisticWeaponRecipe[3] := tantalum;
  ballisticWeaponRecipe[4] := isoMagnet;

  energyWeaponRecipe[0] := tantalum;
  energyWeaponRecipe[1] := adhesive;
  energyWeaponRecipe[2] := caelumite;
  energyWeaponRecipe[3] := zeroWire;
  energyWeaponRecipe[4] := isoMagnet;

  explosiveWeaponRecipe[0] := platinum;
  explosiveWeaponRecipe[1] := adhesive;
  explosiveWeaponRecipe[2] := caelumite;
  explosiveWeaponRecipe[3] := iridium;
  explosiveWeaponRecipe[4] := zeroWire;

  armorRecipe[0] := tungsten;
  armorRecipe[1] := adhesive;
  armorRecipe[2] := caelumite;
  armorRecipe[3] := polymer;
  armorRecipe[4] := spidroin;

  Result := 0;
end;

procedure RebalanceItem(e: IInterface; elementName:string; recipe0:string; recipe1:string; recipe2:string; recipe3:string; recipe4:string; perk:string; research:string);
var  
  container, node, value: IwbElement;
begin
  if (pos('_02', elementName) > 0) then begin
    Remove(ElementBySignature(e, 'FVPA'));
    container := Add(e, 'FVPA', false);
    node := Add(container, 'Component', false);
    SetElementEditValues(node, 'Component', recipe0);
    SetElementEditValues(node, 'Count', '8');
    node := Add(container, 'Component', false);
    SetElementEditValues(node, 'Component', recipe1);
    SetElementEditValues(node, 'Count', '5');
    node := Add(container, 'Component', false);
    SetElementEditValues(node, 'Component', recipe2);
    SetElementEditValues(node, 'Count', '3');

    Remove(ElementBySignature(e, 'RQPK'));
    container := Add(e, 'RQPK', false);
    node := Add(container, 'Required Perk', false);
    SetElementEditValues(node, 'Perk', perk);
    SetElementEditValues(node, 'Rank', '4');
    node := Add(container, 'Required Perk', false);
    SetElementEditValues(node, 'Perk', specialPerk);
    SetElementEditValues(node, 'Rank', '1');
  end
  else if (pos('_03', elementName) > 0) then begin
    Remove(ElementBySignature(e, 'FVPA'));
    container := Add(e, 'FVPA', false);
    node := Add(container, 'Component', false);
    SetElementEditValues(node, 'Component', recipe0);
    SetElementEditValues(node, 'Count', '8');
    node := Add(container, 'Component', false);
    SetElementEditValues(node, 'Component', recipe1);
    SetElementEditValues(node, 'Count', '5');
    node := Add(container, 'Component', false);
    SetElementEditValues(node, 'Component', recipe2);
    SetElementEditValues(node, 'Count', '3');
    node := Add(container, 'Component', false);
    SetElementEditValues(node, 'Component', recipe3);
    SetElementEditValues(node, 'Count', '3');

    Remove(ElementBySignature(e, 'RQPK'));
    container := Add(e, 'RQPK', false);
    node := Add(container, 'Required Perk', false);
    SetElementEditValues(node, 'Perk', perk);
    SetElementEditValues(node, 'Rank', '4');
    node := Add(container, 'Required Perk', false);
    SetElementEditValues(node, 'Perk', specialPerk);
    SetElementEditValues(node, 'Rank', '2');
  end
  else if (pos('_04', elementName) > 0) OR (pos('_05', elementName) > 0)  then begin
    Remove(ElementBySignature(e, 'FVPA'));
    container := Add(e, 'FVPA', false);
    node := Add(container, 'Component', false);
    SetElementEditValues(node, 'Component', recipe0);
    SetElementEditValues(node, 'Count', '8');
    node := Add(container, 'Component', false);
    SetElementEditValues(node, 'Component', recipe1);
    SetElementEditValues(node, 'Count', '5');
    node := Add(container, 'Component', false);
    SetElementEditValues(node, 'Component', recipe2);
    SetElementEditValues(node, 'Count', '3');
    node := Add(container, 'Component', false);
    SetElementEditValues(node, 'Component', recipe3);
    SetElementEditValues(node, 'Count', '3');
      node := Add(container, 'Component', false);
    SetElementEditValues(node, 'Component', recipe4);
    SetElementEditValues(node, 'Count', '3');

    Remove(ElementBySignature(e, 'RQPK'));
    container := Add(e, 'RQPK', false);
    node := Add(container, 'Required Perk', false);
    SetElementEditValues(node, 'Perk', perk);
    SetElementEditValues(node, 'Rank', '4');
    node := Add(container, 'Required Perk', false);
    SetElementEditValues(node, 'Perk', specialPerk);
    SetElementEditValues(node, 'Rank', '3');
  end
    SetElementEditValues(ElementBySignature(ElementByIndex(ElementbyName(e, 'Conditions'), 0), 'CTDA'), 'Research Project', research);
end;

// called for every record selected in xEdit
function Process(e: IInterface): integer;

var
  i: integer;
  elementName: string;
begin
  if Signature(e) = 'COBJ' then begin
    elementName := Name(e);
    if (pos('Helmet', elementName) > 0) then begin
      RebalanceItem(e, elementName, armorRecipe[0], armorRecipe[1], armorRecipe[2], armorRecipe[3], armorRecipe[4], armorPerk, helmetResearch);
    end
    else if (pos('Backpack', elementName) > 0) then begin
      RebalanceItem(e, elementName, armorRecipe[0], armorRecipe[1], armorRecipe[2], armorRecipe[3], armorRecipe[4], armorPerk, backpackResearch);
    end
    else if (pos('Spacesuit', elementName) > 0) then begin
      RebalanceItem(e, elementName, armorRecipe[0], armorRecipe[1], armorRecipe[2], armorRecipe[3], armorRecipe[4], armorPerk, suitResearch);
    end
    else if (pos('Clothing', elementName) = 0) AND (pos('Hat', elementName) = 0) then begin
      for i:=0 to 7 do begin
        if pos(meleeWeaponNames[i], elementName) > 0 then begin
          RebalanceItem(e, elementName, meleeWeaponRecipe[0], meleeWeaponRecipe[1], meleeWeaponRecipe[2], meleeWeaponRecipe[3], meleeWeaponRecipe[4], weaponPerk, meleeWeaponResearch);
          Exit;
        end
      end;
      for i:=0 to 27 do begin
        if pos(ballisticWeaponNames[i], elementName) > 0 then begin
          RebalanceItem(e, elementName, ballisticWeaponRecipe[0], ballisticWeaponRecipe[1], ballisticWeaponRecipe[2], ballisticWeaponRecipe[3], ballisticWeaponRecipe[4], weaponPerk, weaponResearch);
          Exit;
        end
      end;
      for i:=0 to 9 do begin
        if pos(energyWeaponNames[i], elementName) > 0 then begin
          RebalanceItem(e, elementName, energyWeaponRecipe[0], energyWeaponRecipe[1], energyWeaponRecipe[2], energyWeaponRecipe[3], energyWeaponRecipe[4], weaponPerk, weaponResearch);
          Exit;
        end
      end;
      for i:=0 to 4 do begin
        if pos(explosiveWeaponNames[i], elementName) > 0 then begin
          RebalanceItem(e, elementName, explosiveWeaponRecipe[0], explosiveWeaponRecipe[1], explosiveWeaponRecipe[2], explosiveWeaponRecipe[3], explosiveWeaponRecipe[4], weaponPerk, weaponResearch);
          Exit;
        end
      end;
    end
  end
  //AddMessage(Name(e))
  Result := 0;
end;

end.