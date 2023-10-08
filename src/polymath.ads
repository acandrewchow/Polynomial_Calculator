with linkedlist; use linkedlist;
-- polymath package which contains the procedures to perform polynomial arithmetic operations
package polymath is
    -- Subtracts polynomial A and B, then writes the result polynomial
    procedure addpoly(A : linkedlist.Node_Ptr; B : linkedlist.Node_Ptr);
    -- Adds polynomial A and B, then writes the result polynomial
    procedure subpoly(A : linkedlist.Node_Ptr; B : linkedlist.Node_Ptr);
    -- Multiplys polynomial A and B, then writes the result polynomial
    procedure multpoly(A : linkedlist.Node_Ptr; B : linkedlist.Node_Ptr);
    -- Takes a polynomial and adds like terms (terms with the same exponent)
    procedure addTerms(A : linkedlist.Node_Ptr);
    -- Evaluates a polynomial for the given value of X
    procedure evalPoly(A: linkedlist.Node_Ptr; X: Integer);
end polymath;