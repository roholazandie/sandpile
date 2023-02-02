function [state, avalanche, count] = topple(state, n, m, N)

    avalanche(1:N, 1:N) = 0;
    n_parents = 1;
    parents_location(1,1:2) = [n, m];
    children_location(1:1:2) = [n, m];
       
    state(n, m) = state(n,m)+1;
    count = 0;
    while n_parents > 0
        n_childrens = 0;
        for i=1:n_parents
            x = parents_location(i, 1);
            y = parents_location(i, 2);
            if state(x, y)>3 % the parent site will topple 
                count = count + 1;
                avalanche(x, y) = avalanche(x, y) + 1; 
                state(x, y) = state(x, y) - 4; %remove grain
                % distribute it to the neighbors, if they are out of the 
                % box ignore them (like falling of the table)
                if x < N
                    n_childrens = n_childrens+1;
                    children_location(n_childrens, 1:2) = [x+1, y]; % right
                    state(x+1, y) = state(x+1, y) +1; 
                end

                if x > 1
                    n_childrens = n_childrens+1;
                    children_location(n_childrens, 1:2) = [x-1, y]; % left
                    state(x-1,y) = state(x-1, y) +1; 
                end

                if y < N
                    n_childrens = n_childrens+1;
                    children_location(n_childrens, 1:2) = [x, y+1]; %above
                    state(x, y+1) = state(x, y+1) +1; 
                end

                if y >1
                    n_childrens = n_childrens+1;
                    children_location(n_childrens, 1:2) = [x, y-1]; %below
                    state(x, y-1) = state(x, y-1) +1; 
                end


            end
        end
        n_parents = n_childrens;
        parents_location = children_location;

    end


end