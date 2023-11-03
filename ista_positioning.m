function [x_I, y_I] = ista_positioning(kappa, AOA, ToF, ToF_err, x_R, y_R, LOS, h)
% Estimates the ISTA position considering the third scenario
% in [Table 11-11a, 1], i.e., using just the ToF and I2R AOA estmation
% and the distance of the RSTA to the wall.
%   C = ADDME(A) adds A to itself.
%
%   [x_I, y_I] = ista_positioning(kappa, AOA, ToF, x_R, y_R, LOS, h)
%   estimates the position of the ISTA (x_I, y_I) knowing that the RSTA AWV
%   has a calibration of kappa degrees, that it received the FTM EDMG PPDU
%   with an angle of AOA degrees, the FTM EDMG PPDU took ToF
%   seconds to travel from the ISTA to the RSTA, that the ToF has
%   an std dev. error of ToF_err, that the RSTA is at
%   coordinates (x_R, y_R), whether the ISTA and RSTA are at LOS
%   or not (using LOS assessment [1]), and the distance h from the
%   RSTA to the bouncing wall.
%
%   [1] "IEEE Standard for Information Technology--Telecommunications and
%       Information Exchange between Systems Local and Metropolitan Area
%       Networks--Specific Requirements Part 11: Wireless LAN Medium
%       Access Control (MAC) and Physical Layer (PHY) Specifications
%       Amendment 4: Enhancements for Positioning," in
%       IEEE Std 802.11az-2022 (Amendment to IEEE Std 802.11-2020 as
%       amended by IEEE Std 802.11ax-2021, IEEE Std 802.11ay-2021,
%       IEEE Std 802.11ba-2021, and IEEE Std 802.11-2020/Cor 1-2022),
%       vol., no., pp.1-248, 3 March 2023,
%       doi: 10.1109/IEEESTD.2023.10058117.


% Constants
c = 3e8; % speed of light

AOA = AOA * pi/180; % AOA in radians
kappa = kappa * pi/180; % calibration in radians
alpha = AOA + kappa; % calibration+AOA angle


%%%%%%%%%%%%%%%
% STAs at LOS %
%%%%%%%%%%%%%%%
if LOS
    x_I = x_R + (ToF+ToF_err) * c * sin(AOA + kappa);
    y_I = x_R - (ToF+ToF_err) * c * cos(AOA + kappa);

%%%%%%%%%%%%%%%%
% STAs at NLOS %
%%%%%%%%%%%%%%%%
else
    % TODO - detailed upon acceptance.
end

end




