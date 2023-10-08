with Text_IO; use Text_IO;

with polylink;
package body polymath is
    -- Adds two polynomials together, A and B
    procedure addpoly(A : linkedlist.Node_Ptr; B : linkedlist.Node_Ptr) is
        result : linkedlist.Node_Ptr;
        polynomialA : linkedlist.Node_Ptr;
        polynomialB : linkedlist.Node_Ptr;
    begin
        -- Reference to the head
        polynomialA := A;
        polynomialB := B;
        -- Iterate through the list
        while polynomialA /= null and polynomialB /= null loop
            -- Case 1: If the exponents are the same, we can add the coefficients together and iterate
            if polynomialA.Exponent = polynomialB.Exponent then
                linkedlist.addNode(polynomialA.Coefficient + polynomialB.Coefficient, polynomialA.Exponent, result);
                polynomialA := polynomialA.Next;
                polynomialB := polynomialB.Next;
            -- Case 2: If an exponent is larger than the other, add the current exponent and iterate
            elsif polynomialA.Exponent > polynomialB.Exponent then
                linkedlist.addNode(polynomialA.Coefficient, polynomialA.Exponent, result);
                polynomialA := polynomialA.Next;
            -- Case 3: Exponent is less than the other, add the current exponent and iterate
            else
                linkedlist.addNode(polynomialB.Coefficient, polynomialB.Exponent, result);
                polynomialB := polynomialB.Next;
            end if;
        end loop;
        -- Appending the coefficients without exponents to the result
        while polynomialA /= null loop
            linkedlist.addNode(polynomialA.Coefficient, polynomialA.Exponent, result);
            polynomialA := polynomialA.Next;
        end loop;
        while polynomialB /= null loop
            linkedlist.addNode(polynomialB.Coefficient, polynomialB.Exponent, result);
            polynomialB := polynomialB.Next;
        end loop;
        -- Prints out the equation and solution to the user
        put_line("Adding the two polynomials together");
        put("Equation: ");
        put("(");
        polylink.writePoly(A);
        put(")");
        put(" + ");
        put("(");
        polylink.writePoly(B);
        put(")");
        new_line;
        put("Solution: ");
        polylink.writePoly(result);
        new_line;
    end addpoly;

    -- Subtracts polynomial B from A
    procedure subpoly(A : linkedlist.Node_Ptr; B : linkedlist.Node_Ptr) is
        result : linkedlist.Node_Ptr;
        polynomialA : linkedlist.Node_Ptr;
        polynomialB : linkedlist.Node_Ptr;
    begin
        -- Reference to the head
        polynomialA := A;
        polynomialB := B;
        -- Iterate through the list
        while polynomialA /= null and polynomialB /= null loop
            -- Case 1: If the exponents are the same, we can subtract the coefficients and iterate to the next node
            if polynomialA.Exponent = polynomialB.Exponent then
                linkedlist.addNode(polynomialA.Coefficient - polynomialB.Coefficient, polynomialA.Exponent, result);
                polynomialA := polynomialA.Next;
                polynomialB := polynomialB.Next;
            -- Case 2: If an exponent is larger than the other, add the current exponent and iterate to the next node
            elsif polynomialA.Exponent > polynomialB.Exponent then
                linkedlist.addNode(polynomialA.Coefficient, polynomialA.Exponent, result);
                polynomialA := polynomialA.Next;
            -- Case 3: Exponent is less than the other, add the current exponent and iterate to the next node
            else
                linkedlist.addNode(-polynomialB.Coefficient, polynomialB.Exponent, result);
                polynomialB := polynomialB.Next;
            end if;
        end loop;
        -- Appending the constants to the expression
        while polynomialA /= null loop
            linkedlist.addNode(polynomialA.Coefficient, polynomialA.Exponent, result);
            polynomialA := polynomialA.Next;
        end loop;
        while polynomialB /= null loop
            linkedlist.addNode(-polynomialB.Coefficient, polynomialB.Exponent, result);
            polynomialB := polynomialB.Next;
        end loop;
        -- Prints out the equation and solution to the user
        put_line("Subtracting the two polynomials together");
        put("Equation: ");
        put("(");
        polylink.writePoly(A);
        put(")");
        put(" - ");
        put("(");
        polylink.writePoly(B);
        put(")");
        new_line;
        put("Solution: ");
        polylink.writePoly(result);
        new_line;
    end subpoly;

    -- Multiplies two polynomials; a and b together
    procedure multpoly(A : linkedlist.Node_Ptr; B : linkedlist.Node_Ptr) is
        result : linkedlist.Node_Ptr;
        polynomialA : linkedlist.Node_Ptr;
        polynomialB : linkedlist.Node_Ptr;
    begin
        -- Reference to the head
        polynomialA := A;
        polynomialB := B;
        -- iterate through the list
        while polynomialA /= null loop
            while polynomialB /= null loop
                -- Multiply the coefficients and add the exponents (exponent rules when multiplying)
                -- A*B, where A and B are exponents:  A + B
                linkedlist.addNode(polynomialA.Coefficient * polynomialB.Coefficient, polynomialA.Exponent + polynomialB.Exponent, result);
                polynomialB := polynomialB.Next;
            end loop;
            -- iterate through the all the nodes for each term in each polynomial
            polynomialA := polynomialA.Next;
            polynomialB := B;
        end loop;
        -- Prints out the polynomials and then the result to the user
        put_line("Multiplying the two polynomials together:");
        new_line;
        put("Equation: ");
        put("(");
        polylink.writePoly(A);
        put(")");
        put(" * ");
        put("(");
        polylink.writePoly(B);
        put(")");
        new_line;
        put("Solution: ");
        -- Prints out the equation and solution to the user
        polymath.addTerms(result);
        polylink.writePoly(result);
        new_line;
    end multpoly;

    -- Evaluates a polynomial for a given value of X
    procedure evalPoly(A: linkedlist.Node_Ptr; X: Integer) is
        currentNode : linkedlist.Node_Ptr;
        result : Integer := 0;
    begin
        -- Initialize our head 
        currentNode := A;
        -- Iterate through the list
        while currentNode /= null loop
            -- Calculate the result i.e if X is 2 and the polynomial is 2x^5
            -- Iterate through and multiply X by the exponents then coefficient
            result := result + (currentNode.Coefficient) * (X ** currentNode.Exponent);
            put("("&Integer'Image(currentNode.Coefficient)&"*"&Integer'Image(X)&"^"&Integer'Image(currentNode.Exponent)&")");
            -- Iterate to the next node in the list
            currentNode := currentNode.Next;
        end loop;
        new_line;
        put_line("The polynomial value with X = " & Integer'Image(X) & " is:" & Integer'Image(result));
    end evalPoly;

    -- This procedure adds like terms in a given polynomial
    -- This is used in multiplying polynomials when there are liked terms after evaluation
    procedure addTerms(A : linkedlist.Node_Ptr) is
        -- values to keep track of the current, next and previous nodes in the list
        currentNode : linkedlist.Node_Ptr;
        nextNode : linkedlist.Node_Ptr;
        prevNode : linkedlist.Node_Ptr;
    begin
        currentNode := A;
        -- Iterate through the list with reference to current and next pointers
        while currentNode /= null loop
            prevNode := currentNode;
            nextNode := currentNode.Next;
            while nextNode /= null loop
                -- If the exponents are the same, add the coefficients
                if currentNode.Exponent = nextNode.Exponent then
                    currentNode.Coefficient := currentNode.Coefficient + nextNode.Coefficient;
                    -- remove the next node in the linked list when finished
                    prevNode.Next := nextNode.Next;
                    nextNode.Next := null;
                    nextNode := prevNode.Next;
                else
                    -- exponents are not the same
                    prevNode := nextNode;
                    nextNode := nextNode.Next;
                end if;
            end loop;
            -- iterate through the next node in the list
            currentNode := currentNode.Next;
        end loop;
    end addTerms;
end polymath;