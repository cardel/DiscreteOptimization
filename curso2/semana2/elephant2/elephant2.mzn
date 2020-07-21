int: T; % maximum time allowed;
set of int: TIME = 1..T;

int: E; % weight of elephant in STONES;
set of int: STONE = 0..E;

int: G; % number of guards
set of int: GUARD = 1..G;
array[GUARD] of STONE: easy;   
array[GUARD] of STONE: hard;
array[GUARD] of TIME: tired;

GUARD: p; % maximum people on pier;
GUARD: b; % maximum people on boat;

set of int: ACT = -1..E; % -1 = goto bank, 0 = wait, > 0 carry stones  
int: wait = 0;
int: to_bank = -1;
array[GUARD,TIME] of var ACT: act;        % action at time t
var TIME: end;                            % end time;

%Represents the present position
enum POS = {Bank, Boat};
set of int: TIME0  = 0..T;

array[TIME0] of var POS: pos;
array[TIME0] of var 0..E: sboat;

constraint pos[0] = Bank;

%Stones in the boat
constraint sboat[0] = 0;

predicate move(var 0..E: shere) =
               let { var 0..E: sthere = E - shere; } in 
                        (sthere > shere);
                        
                        
solve minimize end;


% enum POS = {Bank, Boat};
% array[TIME0] of var POS: pos;

% predicate move(var 0..F: fhere, var 0..W: wrhere) =
%                let { var 0..F: fthere = F - fhere,
%                      var 0..W: wrthere = W - wrhere; } in 
%                         (wrthere = fthere /\ fthere > fhere /\ wrthere > wrhere);
 
% constraint pos[0] = Bank;
% constraint fboat[0] = 0;
% constraint wboat[0] = 0;

% constraint forall(t in TIME) (fboat[t] = move_food[t] + fboat[t-1]); 
% constraint forall(t in TIME) (wboat[t] = move_water[t] + wboat[t-1]); 

% constraint forall(t in TIME)
%                      (move_food[t] * move_water[t] >= 0);
                     
% constraint forall(t in TIME)
%                      (abs (move_food[t]) + abs(move_water[t]) <= G);       
                     
                      
% array[POS] of POS: opp = [Boat,Bank]; 


                                     
% array[POS] of POS: opp = [Boat,Bank];
                     
% predicate elephant(var POS:now, var 0..F: fhere, var 0..W: wrhere, var POS: next)=
% %                                    if move(fhere, wrhere)  then 
% %                                          next = if now = Bank then Boat else Bank endif
% %                                    else 
% %                                           next = now
% %                                    endif;
%                                  next = [now, opp[now]] [move(fhere,wrhere)+1] /\ (fhere = 0 <-> wrhere = 0) ;
                                   
                                   
%  constraint forall(t in TIME)
%                  (let { 
%                        var 0..F: fhere =  [F-fboat[t-1], fboat[t-1]][pos[t-1]];
%                        var 0..W: wrhere = [W-wboat[t-1], wboat[t-1]][pos[t-1]];
%                        }
%                        in 
%                        elephant(pos[t-1],fhere,wrhere,pos[t]));
                       
%  constraint pos[end] = Boat /\ fboat[end] = 0 /\ wboat[end]=0;
%  constraint forall(t in TIME) (t > end -> move_water[t] = 0 /\ move_food[t] = 0);
 
 
%  solve minimize end;
 