package body linkedlist is
    -- Adds a node to the List
    -- Each node will represent a single term in a polynomial i.e 2x^y,
    -- where X is the variable and Y is a integer value representing an exponent
    procedure addNode(coefficient, exponent : Integer; head : in out Node_Ptr) is
    begin
        -- List is empty, add the first node
        if head = null then
                head := new Node'(coefficient => coefficient, exponent => exponent, Next => null);
        else
            -- Add to the next empty spot
            addNode(coefficient, exponent, head.Next);
        end if;
    end addNode;
end linkedlist;