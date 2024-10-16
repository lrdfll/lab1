type
  NodePtr = ^Node;
  Node = record
    Data: Integer;
    Next: NodePtr;
  end;

function FindMax(node: NodePtr): Integer;
var
  max: Integer;
begin
  max := node^.Data;
  node := node^.Next;
  while node <> nil do
  begin
    if node^.Data > max then
      max := node^.Data;
    node := node^.Next;
  end;
  FindMax := max;
end;

function FindMin(node: NodePtr): Integer;
var
  min: Integer;
begin
  min := node^.Data;
  node := node^.Next;
  while node <> nil do
  begin
    if node^.Data < min then
      min := node^.Data;
    node := node^.Next;
  end;
  FindMin := min;
end;

var
  head, node1, node2, node3: NodePtr;
  max, min: Integer;
begin
  New(head);
  head^.Data := 10;

  New(node1);
  node1^.Data := 5;
  head^.Next := node1;

  New(node2);
  node2^.Data := 15;
  node1^.Next := node2;

  New(node3);
  node3^.Data := 3;
  node2^.Next := node3;
  node3^.Next := nil;

  max := FindMax(head);
  min := FindMin(head);

  WriteLn('Максимальный элемент: ', max);
  WriteLn('Минимальный элемент: ', min);
end.