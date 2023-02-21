uses crt;

const
queue_size = 9;

type
QueueElement = Integer;
QueueArray = array[1..queue_size] of QueueElement;
QueuePointer = 1..queue_size;

var
Que: QueueArray;
Front, Rear: QueuePointer;
Element: QueueElement;
a, begin_queue, end_queue: Integer;

procedure Queue;
begin
begin_queue := 1;
end_queue := 1;
end;

function IsEmpty: Boolean;
begin
IsEmpty := begin_queue = end_queue;
end;

function IsFull: Boolean;
begin
IsFull := end_queue = queue_size;
end;

procedure Inqueue(Element: QueueElement);
begin
ClrScr;
if IsFull then
PrintLn('Очердь заполнена!')
else
begin
Que[end_queue] := Element;
end_queue := end_queue + 1;
end;
end;

procedure Delqueue;
var
i: QueuePointer;
begin
ClrScr;
if IsEmpty then
PrintLn('Очередь пустая!')
else
begin
Element := Que[begin_queue];
for i := begin_queue to end_queue - 1 do
Que[i] := Que[i + 1];
end_queue := end_queue - 1;
end;
end;

procedure PrintQueue;
var
i: QueuePointer;
begin
ClrScr;
Print('Очередь: ');
for i := begin_queue to end_queue - 1 do
Write(Que[i], ' ');
WriteLn;
end;

begin
Queue;
repeat
PrintLn('1 - Добавить элемент');
PrintLn('2 - Удалить элемент');
PrintLn('3 - Показать элементы очереди');
PrintLn('0 - Выйти');
Print('Выберите действие: ');
ReadLn(a);
case a of
1: begin
ClrScr;
Print('Введите элемент для добавления в очередь: ');
ReadLn(Element);
Inqueue(Element);
end;
2: Delqueue;
3: PrintQueue;
0: exit;
end;
until a = 0;
end.