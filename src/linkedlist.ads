-- linkedlist package contains the definition for a linked list
package linkedlist is
    type Node;
    type Node_Ptr is access Node;
    -- Node consists of a coefficient, exponent and a pointer to the next node in the linked list
    type Node is record
        coefficient : Integer;
        exponent : Integer;
        next : Node_Ptr;
    end record;
    -- procedure that adds a node to the linked list with the given coefficient, exponent and Head
    procedure addNode(coefficient : Integer; exponent : Integer; head : in out Node_Ptr);
end linkedlist;

