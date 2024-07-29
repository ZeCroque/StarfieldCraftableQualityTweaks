{
  Automatically rebalance the craft of Starfield Extended - Craftable Quality - Fr
}
unit userscript;

var
  meleeWeaponNames: array [0..7] of string;
  energyWeaponNames: array [0..7] of string;

function Initialize: integer;
begin
  meleeWeaponNames[0] := 'CombatKnife';
  meleeWeaponNames[1] := 'BarrowKnife';
  meleeWeaponNames[2] := 'Cutlass';
  meleeWeaponNames[3] := 'OsmiumKnife';
  meleeWeaponNames[4] := 'PainBlade';
  meleeWeaponNames[5] := 'RescueAxe';
  meleeWeaponNames[6] := 'Wakizashi';
  meleeWeaponNames[7] := 'Tanto';
  

  Result := 0;
end;

// called for every record selected in xEdit
function Process(e: IInterface): integer;

var
  container, node, value: IwbElement;
  i: integer;
  elementName: string;
begin
  if Signature(e) = 'COBJ' then begin
    elementName := Name(e);
    if (pos('Helmet', elementName) > 0) OR ((pos('Armor', elementName) > 0) AND (pos('Armored', elementName) = 0)) then begin
      if (pos('_02', elementName) > 0) then begin
        Remove(ElementBySignature(e, 'FVPA'));
        container := Add(e, 'FVPA', false);
        node := Add(container, 'Component', false);
        SetElementEditValues(node, 'Component', '57c8');
        SetElementEditValues(node, 'Count', '2');
        node := Add(container, 'Component', false);
        SetElementEditValues(node, 'Component', '77828');
        SetElementEditValues(node, 'Count', '2');
        node := Add(container, 'Component', false);
        SetElementEditValues(node, 'Component', '252074');
        SetElementEditValues(node, 'Count', '2');

        Remove(ElementBySignature(e, 'RQPK'));
        container := Add(e, 'RQPK', false);
        node := Add(container, 'Required Perk', false);
        SetElementEditValues(node, 'Perk', '27cbc3');
        SetElementEditValues(node, 'Rank', '1');
        node := Add(container, 'Required Perk', false);
        SetElementEditValues(node, 'Perk', '4ce2d');
        SetElementEditValues(node, 'Rank', '1');
      end
      else if (pos('_03', elementName) > 0) then begin
        Remove(ElementBySignature(e, 'FVPA'));
        container := Add(e, 'FVPA', false);
        node := Add(container, 'Component', false);
        SetElementEditValues(node, 'Component', '57c8');
        SetElementEditValues(node, 'Count', '2');
        node := Add(container, 'Component', false);
        SetElementEditValues(node, 'Component', '77828');
        SetElementEditValues(node, 'Count', '2');
        node := Add(container, 'Component', false);
        SetElementEditValues(node, 'Component', '252074');
        SetElementEditValues(node, 'Count', '2');
        node := Add(container, 'Component', false);
        SetElementEditValues(node, 'Component', '77826');
        SetElementEditValues(node, 'Count', '2');

        Remove(ElementBySignature(e, 'RQPK'));
        container := Add(e, 'RQPK', false);
        node := Add(container, 'Required Perk', false);
        SetElementEditValues(node, 'Perk', '27cbc3');
        SetElementEditValues(node, 'Rank', '2');
        node := Add(container, 'Required Perk', false);
        SetElementEditValues(node, 'Perk', '4ce2d');
        SetElementEditValues(node, 'Rank', '2');
      end
      else if (pos('_04', elementName) > 0) then begin
        Remove(ElementBySignature(e, 'FVPA'));
        container := Add(e, 'FVPA', false);
        node := Add(container, 'Component', false);
        SetElementEditValues(node, 'Component', '57c8');
        SetElementEditValues(node, 'Count', '2');
        node := Add(container, 'Component', false);
        SetElementEditValues(node, 'Component', '77828');
        SetElementEditValues(node, 'Count', '2');
        node := Add(container, 'Component', false);
        SetElementEditValues(node, 'Component', '252074');
        SetElementEditValues(node, 'Count', '2');
        node := Add(container, 'Component', false);
        SetElementEditValues(node, 'Component', '77826');
        SetElementEditValues(node, 'Count', '2');
        SetElementEditValues(node, 'Component', '777fc');
        SetElementEditValues(node, 'Count', '2');

        Remove(ElementBySignature(e, 'RQPK'));
        container := Add(e, 'RQPK', false);
        node := Add(container, 'Required Perk', false);
        SetElementEditValues(node, 'Perk', '27cbc3');
        SetElementEditValues(node, 'Rank', '3');
        node := Add(container, 'Required Perk', false);
        SetElementEditValues(node, 'Perk', '4ce2d');
        SetElementEditValues(node, 'Rank', '3');
      end
      else if (pos('_05', elementName) > 0) then begin
        Remove(ElementBySignature(e, 'FVPA'));
        container := Add(e, 'FVPA', false);
        node := Add(container, 'Component', false);
        SetElementEditValues(node, 'Component', '57c8');
        SetElementEditValues(node, 'Count', '5');
        node := Add(container, 'Component', false);
        SetElementEditValues(node, 'Component', '77828');
        SetElementEditValues(node, 'Count', '5');
        node := Add(container, 'Component', false);
        SetElementEditValues(node, 'Component', '252074');
        SetElementEditValues(node, 'Count', '5');
        node := Add(container, 'Component', false);
        SetElementEditValues(node, 'Component', '77826');
        SetElementEditValues(node, 'Count', '5');
        SetElementEditValues(node, 'Component', '777fc');
        SetElementEditValues(node, 'Count', '5');

        Remove(ElementBySignature(e, 'RQPK'));
        container := Add(e, 'RQPK', false);
        node := Add(container, 'Required Perk', false);
        SetElementEditValues(node, 'Perk', '27cbc3');
        SetElementEditValues(node, 'Rank', '4');
        node := Add(container, 'Required Perk', false);
        SetElementEditValues(node, 'Perk', '4ce2d');
        SetElementEditValues(node, 'Rank', '4');
      end
    end
    else if (pos('Clothing', elementName) = 0) AND (pos('Hat', elementName) = 0) then begin
      AddMessage('Weapon' + elementName)
    end
  end

  //AddMessage(Name(e))
  //AddMessage(Path(ElementBySignature(e, 'CNAM')));
  //AddMessage(FullPath(ElementBySignature(e, 'FVPA')));
  //AddMessage(IntToStr(ElementCount(ElementBySignature(LinksTo(ElementBySignature(e, 'CNAM')), 'DATA'))));
  Result := 0;
end;

end.