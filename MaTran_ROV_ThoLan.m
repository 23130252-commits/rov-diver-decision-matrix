% MA TRAN ROV - THO LAN: bo dau vao minh hoa, khong phai tieu chuan DN.
% Ket qua trong bao cao duoc chay bang JavaScript/Python.
clear; clc;
w = [0.30 0.20 0.25 0.10 0.15];
useTime = false; useCost = true; delta = 0.25;
cost = [404064; 428610]; time = [1; 1];
scenarioNames = {'A','B','C','D','E'};
for k = 1:5
    score = [5 4 5; 5 5 3]; eligible = [true; true];
    if k == 2, score(1,2) = 1; end
    if k == 3, score(1,2) = 3; end
    if k == 4, eligible(1) = false; end
    if k == 5, eligible(:) = false; end
    active = [true true true useTime useCost];
    assert(all(isfinite(w)) && all(w >= 0) && abs(sum(w)-1)<1e-8);
    assert(all(score(:)>=1 & score(:)<=5));
    assert(isfinite(delta) && delta>=0 && delta<=5);
    effective = w .* active;
    assert(sum(effective)>0);
    effective = effective / sum(effective);
    fprintf('\nTinh huong %s\n', scenarioNames{k});
    if ~any(eligible)
        disp('Khong co phuong an du dieu kien'); continue;
    elseif ~all(eligible)
        if eligible(1), disp('Chi ROV du dieu kien');
        else, disp('Chi tho lan du dieu kien'); end
        continue;
    end
    fullscore = [score zeros(2,2)];
    if useTime
        assert(all(isfinite(time) & time>0));
        fullscore(:,4) = 5*min(time)./time;
    end
    if useCost
        assert(all(isfinite(cost) & cost>0));
        fullscore(:,5) = 5*min(cost)./cost;
    end
    total = fullscore * effective';
    gap = abs(total(1)-total(2));
    fprintf('ROV %.4f; Tho lan %.4f; Chenh lech %.4f\n', total(1),total(2),gap);
    if gap<1e-10 || gap+1e-10<delta
        disp('Can danh gia them / xem xet ket hop');
    elseif total(1)>total(2), disp('Uu tien ROV');
    else, disp('Uu tien tho lan'); end
end
