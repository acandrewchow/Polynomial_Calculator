with linkedlist; use linkedlist;
-- polylink package which contains two procedures
package polylink is
    -- readPOLY which reads in the user input and stores in the linked list
    procedure readPOLY(polynomialList : in out linkedlist.Node_Ptr);
    -- writePOLY which writes the polynomial to the user
    procedure writePOLY(polynomialList : linkedlist.Node_Ptr);
end polylink;
