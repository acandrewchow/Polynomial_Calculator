with Text_IO; use Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
package body polylink is
    -- Reads in the values for a polynomial (exponent, coefficients) and stores it in the linked list
    procedure readPOLY(polynomialList : in out linkedlist.Node_Ptr) is
        coefficient : Integer;
        exponent : Integer;
    begin
        -- Receive the user input for exponent
        put("Enter the highest exponent of the polynomial (must be a valid integer, i.e 5): ");
        get(exponent);
        skip_line; -- skips the empty buffer line
        put("Enter the coefficients for each term separated by a space (must be valid integers i.e 1 -2 3): ");
        -- Iterate through the user input and parse
        while not End_Of_Line loop
            get(coefficient);
            -- adds a node to the linked list
            linkedlist.addNode(coefficient, exponent, polynomialList);
            -- exponents are X - 1, for every user input in decreasing order
            exponent := exponent - 1;
        end loop;
        -- linkedlist.printList(polynomialList);
    end readPOLY;

    -- Outputs a polynomial to the terminal
    procedure writePOLY(polynomialList : in linkedlist.Node_Ptr) is
        currentNode : linkedlist.Node_Ptr;
    begin
        currentNode := polynomialList;
        -- Special case for first node in the list
        if currentNode.exponent = 0 then
            -- Coefficients
            if currentNode.coefficient >= 0 then
                put(currentNode.coefficient, width => 0);
            else
                put(currentNode.coefficient, width => 0);
            end if;
        else
            -- Exponents and Coefficients
            if currentNode.coefficient >= 0 then
                put(currentNode.coefficient, width => 0);
                put("x^");
                put(currentNode.exponent, width => 0);
            else
                put(currentNode.coefficient, width => 0);
                put("x^");
                put(currentNode.exponent, width => 0);
            end if;
        end if;
        currentNode := currentNode.next;
        while currentNode /= null loop
            -- writes the absolute value of the coefficients if negative otherwise positive
            if currentNode.exponent = 0 then
                -- Coefficients
                if currentNode.coefficient >= 0 then
                    put(" + ");
                    put(currentNode.coefficient, width => 0);
                else
                    put(" - ");
                    put(-currentNode.coefficient, width => 0);
                end if;
            else
                if currentNode.coefficient >= 0 then
                    put(" + ");
                    put(currentNode.coefficient, width => 0);
                    put("x^");
                    put(currentNode.exponent, width => 0);
                else
                    put(" - ");
                    put(-currentNode.coefficient, width => 0);
                    put("x^");
                    put(currentNode.exponent, width => 0);
                end if;
            end if;
            currentNode := currentNode.next;
        end loop;
    end writePOLY;
end polylink;