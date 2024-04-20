
%Copyright 2014 Jean-Francois Mercure, jm801@cam.ac.uk
%This program is distributed under the Lesser GNU General Public License (LGPL)
%This file is part of FTT21x24v3.

% FTT21x24v3 is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
% 
% FTT21x24v3 is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
% 
% You should have received a copy of the GNU General Public License
% along with FTT21x24v3.  If not, see <http://www.gnu.org/licenses/>.

function varargout = FTTTr53x25v3Gui(varargin)
% FTTTR53X25V3GUI MATLAB code for FTTTr53x25v3Gui.fig
%      FTTTR53X25V3GUI, by itself, creates a new FTTTR53X25V3GUI or raises the existing
%      singleton*.
%
%      H = FTTTR53X25V3GUI returns the handle to a new FTTTR53X25V3GUI or the handle to
%      the existing singleton*.
%
%      FTTTR53X25V3GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FTTTR53X25V3GUI.M with the given input arguments.
%
%      FTTTR53X25V3GUI('Property','Value',...) creates a new FTTTR53X25V3GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before FTTTr53x25v3Gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to FTTTr53x25v3Gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help FTTTr53x25v3Gui

% Last Modified by GUIDE v2.5 01-Jun-2016 15:18:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @FTTTr53x25v3Gui_OpeningFcn, ...
                   'gui_OutputFcn',  @FTTTr53x25v3Gui_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before FTTTr53x25v3Gui is made visible.
function FTTTr53x25v3Gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to FTTTr53x25v3Gui (see VARARGIN)

% Choose default command line output for FTTTr53x25v3Gui
handles.output = hObject;

handles.RegStr = {'1 Belgium','2 Denmark','3 Germany','4 Greece','5 Spain','6 France','7 Ireland','8 Italy','9 Luxembourg','10 Netherlands','11 Austria','12 Portugal','13 Finland','14 Sweden','15 UK','16 Czech Republic','17 Estonia','18 Cyprus','19 Latvia','20 Lithuania','21 Hungary','22 Malta','23 Poland','24 Slovenia','25 Slovakia','26 Bulgaria','27 Romania','28 Norway','29 Switzerland','30 Iceland','31 Croatia','32 Turkey','33 Macedonia','34 USA','35 Japan','36 Canada','37 Australia','38 New Zealand','39 Russian Federation','40 Rest of Annex I','41 China','42 India','43 Mexico','44 Brazil','45 Argentina','46 Colombia','47 Rest of Latin America','48 Korea','49 Taiwan','50 Indonesia','51 Europe (all)','52 OPEC excl Venezuela','53 Rest of world','54 Ukraine','55 Saudi Arabia','56 Nigeria','57 South Africa','58 Rest of Africa','59 Africa OPEC'};
set(handles.RegListBox,'string',handles.RegStr);
handles.TechStr = {'1 Petrol Econ','2 Petrol Mid','3 Petrol Lux','4 Pet Adv Econ','5 Pet Adv Mid','6 Pet Adv Lux','7 Diesel Econ','8 Diesel Mid','9 Diesel Lux','10 Die Adv Econ','11 Die Adv Mid','12 Die Adv Lux','13 CNG Econ','14 CNG Mid','15 CNG Lux','16 Hybrid Econ','17 Hybrid Mid','18 Hybrid Lux','19 EV Econ','20 EV Mid','21 EV Lux','22 PHEV Econ','23 PHEV Mid','24 PHEV Lux','25 FC Econ','26 FC Mid','27 FC Lux','28 2-wh <125cc','29 2-wh >125cc','30 Adv 2-wh <125cc','31 Adv 2-wh >125cc'};
set(handles.TechListBox,'string',handles.TechStr);
handles.RegStrAgg = {'1 Europe','2 N. America','3 S. America','4 Cnt Asia','5 East Asia','6 ROW'};
handles.TechStrAgg = {'1 Petrol','2 Adv Petrol','3 Diesel','4 Adv Diesel','5 CNG','6 Hybrid','7 Electric','8 Plug-in EV','9 Fuel Cell','10 2W','11 Adv 2W'};
handles.FuelStr = {'Coal','Other Coal','Crude oil','Fuel oil','Mid Dist','Other gas','Nat Gas','Electricity','Heat','Waste','Biofuels','Hydrogen'};

if ispc
    s = '\';
else
    s = '/';
end
if exist(strcat(trim3(mfilename('fullpath'),s),'/FTTTr53x25v3Filenames.mat'),'file')
    P = load(strcat(trim3(mfilename('fullpath'),s),'/FTTTr53x25v3Filenames.mat'));
    handles.WinPath = P.WinPath;
    set(handles.PathField,'string', handles.WinPath);
    set(handles.CostsEdit,'string',P.AssumptionsFileName);
    set(handles.DemandEdit,'string',P.HistoricalFileName);
    set(handles.PolicyEdit,'string',P.CSCtxtFileName);
    set(handles.SaveFileEdit,'string',P.ScenarioSaveFileName);
    set(handles.EndEdit,'string',num2str(P.EndYear));
    set(handles.dtEdit,'string',num2str(P.dt));
else
    handles.WinPath = pwd;
end
handles.ScenariosEmpty = 1;
handles.Slots(1) = handles.Slot0;
handles.Slots(2) = handles.Slot1;
handles.Slots(3) = handles.Slot2;
handles.Slots(4) = handles.Slot3;
handles.Slots(5) = handles.Slot4;
handles.Slots(6) = handles.Slot5;
handles.Slots(7) = handles.Slot6;
handles.Slots(8) = handles.Slot7;
handles.Slots(9) = handles.Slot8;
handles.Slots(10) = handles.Slot9;
handles.NWR = 59;
handles.NTT = 31;
handles.ScCalculated = zeros(10,1);
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes FTTTr53x25v3Gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = FTTTr53x25v3Gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


%===============================================================================
%==========Useful Code Here!!!==================================================
%===============================================================================

function ChooseExcelFile_Callback(hObject, eventdata, handles)
[NFile,NPath] = uigetfile(strcat(handles.WinPath,'.\*.*'),'Choose an Excel file');
if ~(sum(NPath) == 0)
    set(handles.PathField,'string', NPath);
    set(handles.CostsEdit,'string', NFile);
    handles.WinPath = NPath;
    SaveFields(handles);
end
guidata(hObject, handles);

function ChooseHistorical_Callback(hObject, eventdata, handles)
[NFile,NPath] = uigetfile(strcat(handles.WinPath,'\*.*'),'Choose an Excel file');
if ~(sum(NPath) == 0)
    set(handles.PathField,'string', NPath);
    set(handles.DemandEdit,'string', NFile);
    handles.WinPath = NPath;
    SaveFields(handles);
end
guidata(hObject, handles);


function ChooseCSCtxt_Callback(hObject, eventdata, handles)
[NFile,NPath] = uigetfile(strcat(handles.WinPath,'\*.*'),'Choose an text file');
if ~(sum(NPath) == 0)
    set(handles.PathField,'string', NPath);
    set(handles.PolicyEdit,'string', NFile);
    handles.WinPath = NPath;
    SaveFields(handles);
end
guidata(hObject, handles);

function ChooseSaveFile_Callback(hObject, eventdata, handles)
[NFile,NPath] = uigetfile(strcat(handles.WinPath,'\*.*'),'Choose an matlab file');
if ~(sum(NPath) == 0)
    set(handles.PathField,'string', NPath);
    set(handles.SaveFileEdit,'string', NFile);
    handles.WinPath = NPath;
    SaveFields(handles);
end
guidata(hObject, handles);

function ChooseExportFile_Callback(hObject, eventdata, handles)
[NFile,NPath] = uigetfile(strcat(handles.WinPath,'\*.*'),'Choose an matlab file');
if ~(sum(NPath) == 0)
    set(handles.PathField,'string', NPath);
    set(handles.ExportFileEdit,'string', NFile);
    handles.WinPath = NPath;
    SaveFields(handles);
end
guidata(hObject, handles);

function LoadScenarios_Callback(hObject, eventdata, handles)
%---Function that loads scenario files and identifies calculated scenarios
%cd(get(handles.PathField,'string'));
SaveFileName = get(handles.SaveFileEdit,'string');
handles.WinPath = get(handles.PathField,'string');

%Find existing scenarios in Common Data Format Files
Filenames = ls(strcat(handles.WinPath,trim3(SaveFileName,'.'),'*.cdf'));
%Scenario numbers
if ispc
    k = str2num(Filenames(:,length(trim3(SaveFileName,'.'))+[1:2]))'+1;
else
    k2 = strread(Filenames,'%s\t');
    for i = 1:length(k2)
        k(i) = str2num(k2{i}(:,length(trim3(SaveFileName,'.'))+[1:2]))+1;
    end
end
for i = k
    handles.Scenario(i) = FTTLoadCDF(strcat(handles.WinPath,trim3(SaveFileName,'.'),sprintf('%02d',i-1),'.cdf'));
    set(handles.Slots(i),'BackgroundColor',[1 0 0]);
end
%Clear scenarios that don't have a file
for i = find(~ismember([1:10],k))
    set(handles.Slots(i),'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
    clear handles.Scenario(i);
end    
handles.ScenariosEmpty = 0;
set(handles.SavedText,'string','Saved','foregroundcolor','r');
guidata(hObject, handles);

function SaveScenarios_Callback(hObject, eventdata, handles)
%---Function that saves scenarios in a .mat file
SaveFileName = get(handles.SaveFileEdit,'string');
handles.WinPath = get(handles.PathField,'string');
%This if is to protect scenarios from being erased with empty variables by
%accidentally pressing save after starting FTT
if handles.ScenariosEmpty == 0
    %save(SaveFileName,'handles');
    kk = find(handles.ScCalculated);
    for j = 1:length(kk)
        i = kk(j);
        if ~isempty(handles.Scenario(i).S)
            %Note that i-1 concerns that scenario 0 stands for the baseline
            FTTSaveCDF(strcat(handles.WinPath,trim3(SaveFileName,'.'),sprintf('%02d',i-1),'.cdf'),handles.Scenario(i));
            set(handles.Slots(i),'BackgroundColor',[1 0 0]);
        else
            set(handles.Slots(i),'BackgroundColor',[ 0.94118 0.94118 0.94118]);
        end
    end
    set(handles.SavedText,'string','Saved','foregroundcolor','r');
end



function SaveFields(handles)
%---Function that saves in a .mat file the content of the gui input fields
WinPath = handles.WinPath;
AssumptionsFileName = get(handles.CostsEdit,'string');
HistoricalFileName = get(handles.DemandEdit,'string');
CSCtxtFileName = get(handles.PolicyEdit,'string');
ScenarioSaveFileName = get(handles.SaveFileEdit,'string');
EndYear = str2num(get(handles.EndEdit,'string'));
dt = str2num(get(handles.dtEdit,'string'));
if ispc
    %For Windows
    save(strcat(trim3(mfilename('fullpath'),'\'),'\FTTTr53x25v3Filenames.mat'),'WinPath','AssumptionsFileName','HistoricalFileName','CSCtxtFileName','ScenarioSaveFileName','EndYear','dt');
else
    %For mac
    save(strcat(trim3(mfilename('fullpath'),'/'),'/FTTTr53x25v3Filenames.mat'),'WinPath','AssumptionsFileName','HistoricalFileName','CSCtxtFileName','ScenarioSaveFileName','EndYear','dt');
end

function k = ScenarioNumber(handles)
%---Function that tells which scenario is the current including the baseline
kk = get(get(handles.ScenarioSelector,'SelectedObject'),'string');
switch kk % 0 is for the baseline
    case '0'
        k = 1;
    case '1'
        k = 2;
    case '2'
        k = 3;
    case '3'
        k = 4;
    case '4'
        k = 5;
    case '5'
        k = 6;
    case '6'
        k = 7;
    case '7'
        k = 8;
    case '8'
        k = 9;
    case '9'
        k = 10;
end




function [GPriceSheet,SharesSheet,DemandSheet,VehiclesSheet,SalesSheet,CostSheet,VTSheet,FTSheet,RTSheet,REGSheet,ExCapSheet,CO2Sheet,BFMSheet] = ReadData(Filename,k)
%Filenames is a cell of strings

if (exist(Filename))
    % income rate from E3ME
    %IncomeRateSheet = xlsread(Filename,strcat('IncomeRate'));
    %income price data
    GPriceSheet = xlsread(Filename,strcat('GPrice'));
    % read cost data 
    CostSheet = xlsread(Filename,strcat('Costs'));
    % read shares data 
    SharesSheet = xlsread(Filename,'TEWS');
    %%read demand data 
    DemandSheet = xlsread(Filename,strcat('RVKM'));
    %read demand data 
    VehiclesSheet = xlsread(Filename,strcat('RFLT'));
    %read Sales data 
    SalesSheet = xlsread(Filename,strcat('RVEH'));
    %read policy data 
    VTSheet = xlsread(Filename,strcat('TTVT',num2str(k-1)));
    FTSheet = xlsread(Filename,strcat('RTFT',num2str(k-1)));
    RTSheet = xlsread(Filename,strcat('TTRT',num2str(k-1)));
    REGSheet = xlsread(Filename,strcat('TREG',num2str(k-1)));
    CO2Sheet = xlsread(Filename,strcat('RTCO',num2str(k-1)));
    BFMSheet = xlsread(Filename,strcat('RBFM',num2str(k-1)));
    ExCapSheet = xlsread(Filename,strcat('TWSA',num2str(k-1))); 
    
    FTSheet = xlsread(Filename,strcat('RTFT',num2str(k-1)));
else
    errordlg('Assumptions files not found');
    % read cost data 
    CostSheet = '';
    % read shares data 
    SharesSheet = '';
    %%read demand data 
    GPriceSheet = '';
    %%read demand data 
    EffectSSheet = '';
    %%Price sheet
    DemandSheet = '';
    %read demand data 
    VehiclesSheet = '';
    %read demand data 
    SalesSheet = '';
    % read income rate 
    %IncomeRateSheet= '';
    %read policy data 
    VTSheet = '';
    FTSheet = '';
    RTSheet = '';
    REGSheet = '';
    CO2Sheet = '';
    ExCapSheet = '';
end

%---
function CalcScenario_Callback(hObject, eventdata, handles)
%---Function that calculates the scenario
k = ScenarioNumber(handles);

set(handles.Slots(k),'BackgroundColor',[0 1 0]);
%Filenames
Filename = strcat(get(handles.PathField,'string'),get(handles.CostsEdit,'string'));
%Data
[GPriceSheet,SharesSheet,DemandSheet,VehiclesSheet,SalesSheet,CostSheet,VTSheet,FTSheet,RTSheet,REGSheet,ExCapSheet,CO2Sheet,BFMSheet] = ReadData(Filename,k);
handles.DataScenario(k).SharesSheet = SharesSheet;
handles.DataScenario(k).GPriceSheet = GPriceSheet;
handles.DataScenario(k).DemandSheet = DemandSheet;
handles.DataScenario(k).VehiclesSheet = VehiclesSheet;
handles.DataScenario(k).SalesSheet = SalesSheet;
handles.DataScenario(k).CostSheet = CostSheet;
handles.DataScenario(k).VTSheet = VTSheet;
handles.DataScenario(k).FTSheet = FTSheet;
handles.DataScenario(k).RTSheet = RTSheet;
handles.DataScenario(k).REGSheet = REGSheet;
handles.DataScenario(k).CO2Sheet = CO2Sheet;
handles.DataScenario(k).ExCapSheet = ExCapSheet;
handles.DataScenario(k).BFMSheet = BFMSheet;
EndYear = str2num(get(handles.EndEdit,'string'));
dt = str2num(get(handles.dtEdit,'string'));
NTT = handles.NTT; NWR = handles.NWR;
handles.EndYear = EndYear;
handles.dt = dt;

if ~isempty(SharesSheet)
    %Simulation here!
    clear handles.Scenario(k);
    handles.Scenario(k) = FTTTr53x25v3(GPriceSheet,SharesSheet,DemandSheet,VehiclesSheet,SalesSheet,CostSheet,VTSheet,FTSheet,RTSheet,REGSheet,ExCapSheet,CO2Sheet,BFMSheet,dt,NTT,NWR,EndYear);
    handles.ScCalculated(k) = 1;
end

set(handles.Slots(k),'BackgroundColor',[1 1 0]);
set(hObject,'value',0);
set(handles.SavedText,'string','Not Saved','foregroundcolor','g');
handles.ScenariosEmpty = 0;
%Get list of variables as defined in the output structure of the calculation
VarList = fieldnames(handles.Scenario(k));
%Discard first few ones (t, th)
set(handles.VarListBox,'string',VarList(3:end));
guidata(hObject, handles);

function out = varname(var)
    out = inputname(1)


function CalcAll_Callback(hObject, eventdata, handles)
%---Function that calculates all baseline+scenarios
kk = str2num(get(handles.MaxScenarioEdit,'string'))+1;
for k = kk
    set(handles.Slots(k),'BackgroundColor',[0 1 0]);
    %Filenames
    Filename = strcat(get(handles.PathField,'string'),get(handles.CostsEdit,'string'));
    %Data
    [GPriceSheet,SharesSheet,DemandSheet,VehiclesSheet,SalesSheet,CostSheet,VTSheet,FTSheet,RTSheet,REGSheet,ExCapSheet,CO2Sheet,BFMSheet] = ReadData(Filename,k);
    handles.DataScenario(k).GPriceSheet = GPriceSheet;
    handles.DataScenario(k).SharesSheet = SharesSheet;
    handles.DataScenario(k).DemandSheet = DemandSheet;
    handles.DataScenario(k).VehiclesSheet = VehiclesSheet;
    handles.DataScenario(k).SalesSheet = SalesSheet;
    handles.DataScenario(k).CostSheet = CostSheet;
    handles.DataScenario(k).VTSheet = VTSheet;
    handles.DataScenario(k).FTSheet = FTSheet;
    handles.DataScenario(k).RTSheet = RTSheet;
    handles.DataScenario(k).REGSheet = REGSheet;
    handles.DataScenario(k).CO2Sheet = CO2Sheet;
    handles.DataScenario(k).ExCapSheet = ExCapSheet;
    EndYear = str2num(get(handles.EndEdit,'string'));
    dt = str2num(get(handles.dtEdit,'string'));
    NTT = handles.NTT; NWR = handles.NWR;
    handles.EndYear = EndYear;
    handles.dt = dt;

    if ~isempty(SharesSheet)
        %Simulation here!
        clear handles.Scenario(k);
        handles.Scenario(k) = FTTTr53x25v3(GPriceSheet,SharesSheet,DemandSheet,VehiclesSheet,SalesSheet,CostSheet,VTSheet,FTSheet,RTSheet,REGSheet,ExCapSheet,CO2Sheet,BFMSheet,dt,NTT,NWR,EndYear);
        %Save data in case the rest crashes
        guidata(hObject, handles);
        handles.ScenariosEmpty = 0;
        handles.ScCalculated(k) = 1;
    end
    
    set(handles.Slots(k),'BackgroundColor',[1 1 0]);
end
set(hObject,'value',0);
set(handles.SavedText,'string','Not Saved','foregroundcolor','g');
%Get list of variables as defined in the output structure of the calculation
VarList = fieldnames(handles.Scenario(k));
%Discard first few ones (t, th)
set(handles.VarListBox,'string',VarList(3:end));
guidata(hObject, handles);



function [N,AH] = FigureAxes(handles)
%---Function that opens a figure and/or axes depending on what's in fields
N = str2double(get(handles.FigureEdit,'string'));
AH = str2double(get(handles.AxesEdit,'string')); 
if isempty(N) | isnan(N)
    %figure(1);
    set(gcf,'position',[584 192 925 624]);
else
    figure(N);
    if isempty(findobj(gcf,'type','axes'))
        set(gcf,'position',[584 192 925 624]);
    end
end
AH = str2double(get(handles.AxesEdit,'string'));
if ~isempty(AH) & ~isnan(AH)
    if AH == 0
        axes(gca); 
    else
        axes(AH);
    end
%else
%    AH = axes('Parent',gcf);
end
set(gca,'ylimmode','auto');

%------------Plot Functions------------------------------------------------

%---
function PlotAllButton_Callback(hObject, eventdata, handles)
%---Function that plots the data with one line per technology
%i = get(get(handles.VariablSelector,'SelectedObject'),'string');
i = get(handles.VarListBox,'Value');
VarList = get(handles.VarListBox,'String');
VarName = VarList{i};
R = get(handles.RegListBox,'Value');
RegList = get(handles.RegListBox,'string');
T = get(handles.TechListBox,'Value');
TechList = get(handles.TechListBox,'string');
k = ScenarioNumber(handles);
RT = get(get(handles.RegTechSelector,'SelectedObject'),'string');

switch RT
    case 'Tech'
        TechStr = TechList(T,:);
        if (length(R) < 4)
            RegStr = RegList(R,:);
        elseif R == handles.NWR
            RegStr = 'World';
        else
            RegStr = '';
        end
    case 'Regions'
        RegStr = RegList(R,:);
        if length(T) < 4
            TechStr = TechList(T,:);
        elseif T == handles.NTT
            TechStr = 'All Tech';
        else
            TechStr = '';
        end
end

%Dims: (t, NET, NWR)
if sum(((get(handles.Slots(k),'BackgroundColor')==[1 0 0]) | (get(handles.Slots(k),'BackgroundColor')==[1 1 0])))==3
    [handles.N,handles.AH] = FigureAxes(handles);
    switch VarName
        case 'W'
            switch RT
                case 'Regions'
                    FTTTrplotXCat(handles.Scenario(k).th,sum(handles.Scenario(k).W(:,T),2),TechStr,RegStr);
                    title('Cumulative capacity (k-seats)');
                case 'Tech'
                    FTTTrplotXCat(handles.Scenario(k).th,handles.Scenario(k).W(:,T),RegStr,TechStr);
                    title('Cumulative capacity (k-seats)');
            end
        otherwise
            if size(handles.Scenario(k).(VarName),1) == size(handles.Scenario(k).t,1)
                tname = 't';
            else
                tname = 'th';
            end
            if ndims(handles.Scenario(k).(VarName))==2  %Means it's missing the NTT dimension
                FTTTrplotXCat(handles.Scenario(k).th,handles.Scenario(k).(VarName)(:,R),RegStr,RegStr);
                title(VarName);
            else
                switch RT
                    case 'Regions'
                        FTTTrplotXCat(handles.Scenario(k).(tname),permute(sum(handles.Scenario(k).(VarName)(:,T,R),2),[1 3 2]),TechStr,RegStr);
                        title(VarName);
                    case 'Tech'
                        FTTTrplotXCat(handles.Scenario(k).(tname),permute(sum(handles.Scenario(k).(VarName)(:,T,R),3),[1 2 3]),RegStr,TechStr);
                        title(VarName);
                end
            end
    end
end

%------------Patch Functions-----------------------------------------------

function PatchAllData_Callback(hObject, eventdata, handles)
%FTTTrpatchARB(XX,YY,Q,L)
%---Function that patches areas for each technology
%---Function that plots the data with one line per technology
%i = get(get(handles.VariablSelector,'SelectedObject'),'string');
i = get(handles.VarListBox,'Value');
VarList = get(handles.VarListBox,'String');
VarName = VarList{i};
R = get(handles.RegListBox,'Value');
RegList = get(handles.RegListBox,'string');
T = get(handles.TechListBox,'Value');
TechList = get(handles.TechListBox,'string');
k = ScenarioNumber(handles);
RT = get(get(handles.RegTechSelector,'SelectedObject'),'string');

switch RT
    case 'Tech'
        TechStr = TechList(T,:);
        if (length(R) < 4)
            RegStr = RegList(R,:);
        elseif R == handles.NWR
            RegStr = 'World';
        else
            RegStr = '';
        end
    case 'Regions'
        RegStr = RegList(R,:);
        if length(T) < 4
            TechStr = TechList(T,:);
        elseif T == handles.NTT
            TechStr = 'All Tech';
        else
            TechStr = '';
        end
end

%Dims: (t, NET, NWR)
if sum(((get(handles.Slots(k),'BackgroundColor')==[1 0 0]) | (get(handles.Slots(k),'BackgroundColor')==[1 1 0])))==3
    [handles.N,handles.AH] = FigureAxes(handles);
     switch VarName
        case 'W'
            switch RT
                case 'Regions'
                    FTTTrpatchARB2(handles.Scenario(k).th,sum(handles.Scenario(k).W(:,T),2),TechStr,RegStr);
                    title('Cumulative capacity (k-seats)');
                case 'Tech'
                    FTTTrpatchARB2(handles.Scenario(k).th,handles.Scenario(k).W(:,T),RegStr,TechStr);
                    title('Cumulative capacity (k-seats)');
            end
        otherwise
            if size(handles.Scenario(k).(VarName),1) == size(handles.Scenario(k).t,1)
                tname = 't';
            else
                tname = 'th';
            end
            if ndims(handles.Scenario(k).(VarName))==2  %Means it's missing the NTT dimension
                FTTTrpatchARB2(handles.Scenario(k).th,handles.Scenario(k).(VarName)(:,R),RegStr,RegStr);
                title(VarName);
            else
                switch RT
                    case 'Regions'
                        FTTTrpatchARB2(handles.Scenario(k).(tname),permute(sum(handles.Scenario(k).(VarName)(:,T,R),2),[1 3 2]),TechStr,RegStr);
                        %title(VarName);
                        title(RegStr);
                    case 'Tech'
                        FTTTrpatchARB2(handles.Scenario(k).(tname),permute(sum(handles.Scenario(k).(VarName)(:,T,R),3),[1 2 3]),RegStr,TechStr);
                        %title(VarName);
                        title(RegStr);
                end
            end
    end
end
         
%         case 'S'
%             switch RT
%                 case 'Regions'
%                     FTTTrpatchARB(handles.Scenario(k).th,permute(sum(handles.Scenario(k).S(:,T,R),2),[1 3 2]),TechStr,RegStr);
%                     title('Shares');
%                     set(gca,'ylim',[0 1]);
%                 case 'Tech'
%                     FTTTrpatchARB(handles.Scenario(k).th,permute(sum(handles.Scenario(k).S(:,T,R),3),[1 2 3]),RegStr,TechStr);
%                     title('Shares');
%                     set(gca,'ylim',[0 1]);
%             end
%         case 'G'
%             switch RT
%                 case 'Regions'
%                     FTTTrpatchARB(handles.Scenario(k).th,permute(sum(handles.Scenario(k).G(:,T,R),2),[1 3 2]),TechStr,RegStr);
%                     title('Travel (pkm)');
%                 case 'Tech'
%                     FTTTrpatchARB(handles.Scenario(k).th,permute(sum(handles.Scenario(k).G(:,T,R),3),[1 2 3]),RegStr,TechStr);
%                     title('Travel (pkm)');
%             end
%         case 'U'
%             switch RT
%                 case 'Regions'
%                     FTTTrpatchARB(handles.Scenario(k).th,permute(sum(handles.Scenario(k).U(:,T,R),2),[1 3 2]),TechStr,RegStr);
%                     title('Capacity (k-seats)');
%                 case 'Tech'
%                     FTTTrpatchARB(handles.Scenario(k).th,permute(sum(handles.Scenario(k).U(:,T,R),3),[1 2 3]),RegStr,TechStr);
%                     title('Capacity (k-seats)');
%             end
%         case 'E'
%             switch RT
%                 case 'Regions'
%                     FTTTrpatchARB(handles.Scenario(k).th,permute(sum(handles.Scenario(k).E(:,T,R),2),[1 3 2]),TechStr,RegStr);
%                     title('Emissions (Mt)');
%                 case 'Tech'
%                     FTTTrpatchARB(handles.Scenario(k).th,permute(sum(handles.Scenario(k).E(:,T,R),3),[1 2 3]),RegStr,TechStr);
%                     title('Emissions (Mt)');
%             end
%         case 'I'
%             switch RT
%                 case 'Regions'
%                     FTTTrpatchARB(handles.Scenario(k).th,permute(sum(handles.Scenario(k).I(:,T,R),2),[1 3 2]),TechStr,RegStr);
%                     title('New capacity (k-seats)');
%                 case 'Tech'
%                     FTTTrpatchARB(handles.Scenario(k).th,permute(sum(handles.Scenario(k).I(:,T,R),3),[1 2 3]),RegStr,TechStr);
%                     title('New capacity (k-seats)');
%             end
%         case 'W'
%             switch RT
%                 case 'Regions'
%                     FTTTrpatchARB(handles.Scenario(k).th,sum(handles.Scenario(k).W(:,T),2),TechStr,RegStr);
%                     title('Cumulative capacity (k-seats)');
%                 case 'Tech'
%                     FTTTrpatchARB(handles.Scenario(k).th,handles.Scenario(k).W(:,T),RegStr,TechStr);
%                     title('Cumulative capacity (k-seats)');
%             end
%         otherwise
%             if size(handles.Scenario(k).(VarName),1) == size(handles.Scenario(k).t,1)
%                 tname = 't';
%             else
%                 tname = 'th';
%             end
%             if ndims(handles.Scenario(k).(VarName))==2  %Means it's missing the NTT dimension
%                 FTTTrpatchARB(handles.Scenario(k).th,handles.Scenario(k).(VarName)(:,R),RegStr,RegStr);
%                 title(VarName);
%             else
%                 switch RT
%                     case 'Regions'
%                         FTTTrpatchARB(handles.Scenario(k).(tname),permute(sum(handles.Scenario(k).(VarName)(:,T,R),2),[1 3 2]),TechStr,RegStr);
%                         title(VarName);
%                     case 'Tech'
%                         FTTTrpatchARB(handles.Scenario(k).(tname),permute(sum(handles.Scenario(k).(VarName)(:,T,R),3),[1 2 3]),RegStr,TechStr);
%                         title(VarName);
%                 end
%             end
%     end
%end

function PatchAggButton_Callback(hObject, eventdata, handles)
%---Function that patches easy to read aggregates
%i = get(get(handles.VariablSelector,'SelectedObject'),'string');
i = get(handles.VarListBox,'Value');
VarList = get(handles.VarListBox,'String');
VarName = VarList{i};
R = get(handles.RegListBox,'Value');
RegList = get(handles.RegListBox,'string');
T = get(handles.TechListBox,'Value');
TechList = get(handles.TechListBox,'string');
k = ScenarioNumber(handles);
RT = get(get(handles.RegTechSelector,'SelectedObject'),'string');

switch RT
    case 'Tech'
        TechStr = TechList(T,:);
        if (length(R) < 4)
            RegStr = RegList(R,:);
        elseif R == handles.NWR
            RegStr = 'World';
        else
            RegStr = '';
        end
    case 'Regions'
        RegStr = RegList(R,:);
        if length(T) < 4
            TechStr = TechList(T,:);
        elseif T == handles.NTT
            TechStr = 'All Tech';
        else
            TechStr = '';
        end
end


%Dims: (t, NET, NWR)
if sum(((get(handles.Slots(k),'BackgroundColor')==[1 0 0]) | (get(handles.Slots(k),'BackgroundColor')==[1 1 0])))==3
    [handles.N,handles.AH] = FigureAxes(handles);
    switch VarName
        case 'S'
            switch RT
                case 'Regions'
                    FTTTrpatchAgg(handles.Scenario(k).th,permute(sum(handles.Scenario(k).S(:,T,R),2),[1 3 2]),TechStr,handles.RegStrAgg);
                    title('Shares');
                    set(gca,'ylim',[0 1]);
                case 'Tech'
                    FTTTrpatchAgg(handles.Scenario(k).th,permute(sum(handles.Scenario(k).S(:,T,R),3),[1 2 3]),RegStr,handles.TechStrAgg);
                    title('Shares');
                    set(gca,'ylim',[0 1]);
            end
        case 'G'
            switch RT
                case 'Regions'
                    FTTTrpatchAgg(handles.Scenario(k).th,permute(sum(handles.Scenario(k).G(:,T,R),2),[1 3 2]),TechStr,handles.RegStrAgg);
                    title('Travel (pkm)');
                case 'Tech'
                    FTTTrpatchAgg(handles.Scenario(k).th,permute(sum(handles.Scenario(k).G(:,T,R),3),[1 2 3]),RegStr,handles.TechStrAgg);
                    title('Travel (pkm)');
            end
        case 'U'
            switch RT
                case 'Regions'
                    FTTTrpatchAgg(handles.Scenario(k).th,permute(sum(handles.Scenario(k).U(:,T,R),2),[1 3 2]),TechStr,handles.RegStrAgg);
                    title('Capacity (k-seats)');
                case 'Tech'
                    FTTTrpatchAgg(handles.Scenario(k).th,permute(sum(handles.Scenario(k).U(:,T,R),3),[1 2 3]),RegStr,handles.TechStrAgg);
                    title('Capacity (k-seats)');
            end
        case 'E'
            switch RT
                case 'Regions'
                    FTTTrpatchAgg(handles.Scenario(k).th,permute(sum(handles.Scenario(k).E(:,T,R),2),[1 3 2]),TechStr,handles.RegStrAgg);
                    title('Emissions (Mt)');
                case 'Tech'
                    FTTTrpatchAgg(handles.Scenario(k).th,permute(sum(handles.Scenario(k).E(:,T,R),3),[1 2 3]),RegStr,handles.TechStrAgg);
                    title('Emissions (Mt)');
            end
        case 'I'
            switch RT
                case 'Regions'
                    FTTTrpatchAgg(handles.Scenario(k).th,permute(sum(handles.Scenario(k).I(:,T,R),2),[1 3 2]),TechStr,handles.RegStrAgg);
                    title('New capacity (k-seats)');
                case 'Tech'
                    FTTTrpatchAgg(handles.Scenario(k).th,permute(sum(handles.Scenario(k).I(:,T,R),3),[1 2 3]),RegStr,handles.TechStrAgg);
                    title('New capacity (k-seats)');
            end
        case 'W'
            switch RT
                case 'Regions'
                    FTTTrpatchAgg(handles.Scenario(k).th,sum(handles.Scenario(k).W(:,T),2),TechStr,handles.RegStrAgg);
                    title('Cumulative capacity (k-seats)');
                case 'Tech'
                    FTTTrpatchAgg(handles.Scenario(k).th,handles.Scenario(k).W(:,T),RegStr,handles.TechStrAgg);
                    title('Cumulative capacity (k-seats)');
            end
        otherwise
            if size(handles.Scenario(k).(VarName),1) == size(handles.Scenario(k).t,1)
                tname = 't';
            else
                tname = 'th';
            end
            if ndims(handles.Scenario(k).(VarName))==2  %Means it's missing the NTT dimension
                FTTTrpatchAgg(handles.Scenario(k).th,handles.Scenario(k).(VarName)(:,R),RegStr,handles.RegStrAgg);
                title(VarName);
            else
                switch RT
                    case 'Regions'
                        FTTTrpatchAgg(handles.Scenario(k).(tname),permute(sum(handles.Scenario(k).(VarName)(:,T,R),2),[1 3 2]),TechStr,handles.RegStrAgg);
                        title(VarName);
                    case 'Tech'
                        FTTTrpatchAgg(handles.Scenario(k).(tname),permute(sum(handles.Scenario(k).(VarName)(:,T,R),3),[1 2 3]),RegStr,handles.TechStrAgg);
                        title(VarName);
                end
            end
    end
end


function HoldOnButton_Callback(hObject, eventdata, handles)
%---Function that executes hold on on the current figure
[handles.N,handles.AH] = FigureAxes(handles);
hold on;


function ExportVarBut_Callback(hObject, eventdata, handles)
%---Function that exports one of the results structures to the workspace
%---(outside of this GUI)

k = ScenarioNumber(handles);
if (get(handles.Slots(k),'BackgroundColor')==[1 0 0] | get(handles.Slots(k),'BackgroundColor')==[1 1 0])
    assignin('base',strcat('Sc',num2str(k-1)),handles.Scenario(k));
end    

function ExportExcel_Callback(hObject, eventdata, handles)
%---Function that exports a dataset to an Excel file

VarList = {'S','HG','U','CF','E','LCOE','TLCOE','LCOEs','I','W','FCosts','ICosts','CFCosts','CO2Costs','T'};
RegionsList = {'1- USA','2- Japan','3- Germany','4- UK','5- France','6- Italy','7- Rest EU-15','8- EU-12','9- Canada','10- Australia','11- OECD nes','12- Russia','13- Rest Annex I','14- China','15- India', '16- Mexico','17- Brazil','18- NICs','19- OPEC','20- ROW','21- Indonesia','World'};
k = ScenarioNumber(handles);
ExportFileName = strcat(trim3(get(handles.ExportFileEdit,'string'),'.'),'.xlsx');

%Get the Excel Template with formatting in it
if ispc
    copyfile(strcat(trim3(mfilename('fullpath'),'\'),'\FTTTr53x25v3Template.xlsx'),strcat(pwd,'\ExcelExport\',ExportFileName));
else
    copyfile(strcat(trim3(mfilename('fullpath'),'/'),'/FTTTr53x25v3Template.xlsx'),strcat(pwd,'/ExcelExport/',ExportFileName));
end

if (get(handles.Slots(k),'BackgroundColor')==[1 0 0])
    t = handles.Scenario(k).t';
    Ht = handles.Scenario(k).Ht';
    OutMatrixS = cell(27*20,length(t));
    OutMatrixHG = cell(27*20,length(Ht));
    OutMatrixU = cell(27*20,length(t));
    OutMatrixCF = cell(27*20,length(t));
    OutMatrixE = cell(27*20,length(Ht));
    OutMatrixLCOE = cell(27*20,length(t));
    OutMatrixTLCOE = cell(27*20,length(t));
    OutMatrixLCOEs = cell(27*20,length(t));
    OutMatrixI = cell(27*20,length(t));
    OutMatrixW = cell(27*20,length(t));
    OutMatrixFCosts = cell(27*20,length(t));
    OutMatrixICosts = cell(27*20,length(t));
    OutMatrixCFCosts = cell(27*20,length(t));
    OutMatrixCO2Costs = cell(27*20,length(t));
    OutMatrixT = cell(27*20,length(t));
    for i = 1:20
        %S
        S = handles.Scenario(k).S(:,:,i)';
        OutMatrixS((i-1)*28+1,1) = strcat('Shares - ',RegionsList(i));
        OutMatrixS((i-1)*28+2:i*28,:) = num2cell([t ; ones(1,length(t))*NaN ; S ; ones(1,length(t))*NaN]);
        %G
        HG = handles.Scenario(k).HG(:,:,i)';
        OutMatrixHG((i-1)*28+1,1) = strcat('Generation (GWh) - ',RegionsList(i));
        OutMatrixHG((i-1)*28+2:i*28,:) = num2cell([Ht ; ones(1,length(Ht))*NaN ; HG ; ones(1,length(Ht))*NaN]);
        %U
        U = handles.Scenario(k).U(:,:,i)';
        OutMatrixU((i-1)*28+1,1) = strcat('Capacity (GW) - ',RegionsList(i));
        OutMatrixU((i-1)*28+2:i*28,:) = num2cell([t ; ones(1,length(t))*NaN ; U ; ones(1,length(t))*NaN]);
        %CF
        CF = handles.Scenario(k).CF(:,:,i)';
        OutMatrixCF((i-1)*28+1,1) = strcat('Capacity Factor - ',RegionsList(i));
        OutMatrixCF((i-1)*28+2:i*28,:) = num2cell([t ; ones(1,length(t))*NaN ; CF ; ones(1,length(t))*NaN]);
        %E
        E = handles.Scenario(k).HE(:,:,i)'*1000;
        OutMatrixE((i-1)*28+1,1) = strcat('CO2 Emissions (Mt) - ',RegionsList(i));
        OutMatrixE((i-1)*28+2:i*28,:) = num2cell([Ht ; ones(1,length(Ht))*NaN ; E ; ones(1,length(Ht))*NaN]);
        %LCOE
        LCOE = handles.Scenario(k).LCOE(:,:,i)';
        OutMatrixLCOE((i-1)*28+1,1) = strcat('LCOE ($/MWh) - ',RegionsList(i));
        OutMatrixLCOE((i-1)*28+2:i*28,:) = num2cell([t ; ones(1,length(t))*NaN ; LCOE ; ones(1,length(t))*NaN]);
        %TLCOE
        TLCOE = handles.Scenario(k).TLCOE(:,:,i)';
        OutMatrixTLCOE((i-1)*28+1,1) = strcat('LCOE including taxes/Subsidies ($/MWh) - ',RegionsList(i));
        OutMatrixTLCOE((i-1)*28+2:i*28,:) = num2cell([t ; ones(1,length(t))*NaN ; TLCOE ; ones(1,length(t))*NaN]);
        %LCOEs
        LCOEs = handles.Scenario(k).LCOEs(:,:,i)';
        OutMatrixLCOEs((i-1)*28+1,1) = strcat('LCOE without the carbon cost ($/MWh) - ',RegionsList(i));
        OutMatrixLCOEs((i-1)*28+2:i*28,:) = num2cell([t ; ones(1,length(t))*NaN ; LCOEs ; ones(1,length(t))*NaN]);
        %I
        I = handles.Scenario(k).I(:,:,i)';
        OutMatrixI((i-1)*28+1,1) = strcat('Investment (GW) - ',RegionsList(i));
        OutMatrixI((i-1)*28+2:i*28,:) = num2cell([t ; ones(1,length(t))*NaN ; I ; ones(1,length(t))*NaN]);
        %FCosts
        FCosts = handles.Scenario(k).FCosts(:,:,i)';
        OutMatrixFCosts((i-1)*28+1,1) = strcat('Fuel Costs ($/MWh) - ',RegionsList(i));
        OutMatrixFCosts((i-1)*28+2:i*28,:) = num2cell([t ; ones(1,length(t))*NaN ; FCosts ; ones(1,length(t))*NaN]);
        %ICosts
        ICosts = handles.Scenario(k).ICosts(:,:,i)';
        OutMatrixICosts((i-1)*28+1,1) = strcat('Investment Costs ($/MWh) - ',RegionsList(i));
        OutMatrixICosts((i-1)*28+2:i*28,:) = num2cell([t ; ones(1,length(t))*NaN ; ICosts ; ones(1,length(t))*NaN]);
        %CFCosts
        CFCosts = handles.Scenario(k).CFCosts(:,:,i)';
        OutMatrixCFCosts((i-1)*28+1,1) = strcat('Site quality cost ($/MWh) - ',RegionsList(i));
        OutMatrixCFCosts((i-1)*28+2:i*28,:) = num2cell([t ; ones(1,length(t))*NaN ; CFCosts ; ones(1,length(t))*NaN]);
        %CO2Costs
        CO2Costs = handles.Scenario(k).CO2Costs(:,:,i)';
        OutMatrixCO2Costs((i-1)*28+1,1) = strcat('Carbon Costs ($/MWh) - ',RegionsList(i));
        OutMatrixCO2Costs((i-1)*28+2:i*28,:) = num2cell([t ; ones(1,length(t))*NaN ; CO2Costs ; ones(1,length(t))*NaN]);
        %T
        T = handles.Scenario(k).T(:,:,i)';
        OutMatrixT((i-1)*28+1,1) = strcat('Taxes/Subsidies (% of LCOE) - ',RegionsList(i));
        OutMatrixT((i-1)*28+2:i*28,:) = num2cell([t ; ones(1,length(t))*NaN ; T ; ones(1,length(t))*NaN]);
    end
    %W is global
    W = handles.Scenario(k).W(:,:)';
    OutMatrixW(1,1) = strcat('Cumulative Capacity - ',RegionsList(i));
    OutMatrixW(2:28,:) = num2cell([t ; ones(1,length(t))*NaN ; W ; ones(1,length(t))*NaN]);
    %Save all sheets
    hw = waitbar(0,'Writing Excel File in progress'); i = 0; waitbar(i/15);
    xlswrite(ExportFileName,OutMatrixS,'S'); i = i + 1; waitbar(i/15);
    xlswrite(ExportFileName,OutMatrixHG,'HG'); i = i + 1; waitbar(i/15);
    xlswrite(ExportFileName,OutMatrixU,'U'); i = i + 1; waitbar(i/15);
    xlswrite(ExportFileName,OutMatrixCF,'CF'); i = i + 1; waitbar(i/15);
    xlswrite(ExportFileName,OutMatrixE,'E'); i = i + 1; waitbar(i/15);
    xlswrite(ExportFileName,OutMatrixLCOE,'LCOE'); i = i + 1; waitbar(i/15);
    xlswrite(ExportFileName,OutMatrixTLCOE,'TLCOE'); i = i + 1; waitbar(i/15);
    xlswrite(ExportFileName,OutMatrixLCOEs,'LCOEs'); i = i + 1; waitbar(i/15);
    xlswrite(ExportFileName,OutMatrixI,'I'); i = i + 1; waitbar(i/15);
    xlswrite(ExportFileName,OutMatrixW,'W'); i = i + 1; waitbar(i/15);
    xlswrite(ExportFileName,OutMatrixFCosts,'FCosts'); i = i + 1; waitbar(i/15);
    xlswrite(ExportFileName,OutMatrixICosts,'ICosts'); i = i + 1; waitbar(i/15);
    xlswrite(ExportFileName,OutMatrixCFCosts,'CFCosts'); i = i + 1; waitbar(i/15);
    xlswrite(ExportFileName,OutMatrixCO2Costs,'CO2Costs'); i = i + 1; waitbar(i/15);
    xlswrite(ExportFileName,OutMatrixT,'T'); i = i + 1; waitbar(i/15);
    close(hw);
end    
%cd ..    

function ExportText_Callback(hObject, eventdata, handles)
%---Function that exports a dataset to a Text file

VarList = {'S','HG','U','CF','E','LCOE','TLCOE','LCOEs','I','W','FCosts','ICosts','CFCosts','CO2Costs','T'};
RegionsList = {'1- USA','2- Japan','3- Germany','4- UK','5- France','6- Italy','7- Rest EU-15','8- EU-12','9- Canada','10- Australia','11- OECD nes','12- Russia','13- Rest Annex I','14- China','15- India', '16- Mexico','17- Brazil','18- NICs','19- OPEC','20- ROW','21- Indonesia','World'};
k = ScenarioNumber(handles);
ExportFileName = trim3(get(handles.ExportFileEdit,'string'),'.');
if (get(handles.Slots(k),'BackgroundColor')==[1 0 0])
    t = handles.Scenario(k).t';
    Ht = handles.Scenario(k).Ht';
    OutMatrixS = cell(27*20,length(t));
    OutMatrixHG = cell(27*20,length(Ht));
    OutMatrixU = cell(27*20,length(t));
    OutMatrixCF = cell(27*20,length(t));
    OutMatrixE = cell(27*20,length(Ht));
    OutMatrixLCOE = cell(27*20,length(t));
    OutMatrixTLCOE = cell(27*20,length(t));
    OutMatrixLCOEs = cell(27*20,length(t));
    OutMatrixI = cell(27*20,length(t));
    OutMatrixW = cell(27*20,length(t));
    OutMatrixFCosts = cell(27*20,length(t));
    OutMatrixICosts = cell(27*20,length(t));
    OutMatrixCFCosts = cell(27*20,length(t));
    OutMatrixCO2Costs = cell(27*20,length(t));
    OutMatrixT = cell(27*20,length(t));
    for i = 1:20
        %S
        S = handles.Scenario(k).S(:,:,i)';
        OutMatrixS((i-1)*28+1,1) = strcat('Shares - ',RegionsList(i));
        OutMatrixS((i-1)*28+2:i*28,:) = num2cell([t ; ones(1,length(t))*NaN ; S ; ones(1,length(t))*NaN]);
        %G
        HG = handles.Scenario(k).HG(:,:,i)';
        OutMatrixHG((i-1)*28+1,1) = strcat('Generation (GWh) - ',RegionsList(i));
        OutMatrixHG((i-1)*28+2:i*28,:) = num2cell([Ht ; ones(1,length(Ht))*NaN ; HG ; ones(1,length(Ht))*NaN]);
        %U
        U = handles.Scenario(k).U(:,:,i)';
        OutMatrixU((i-1)*28+1,1) = strcat('Capacity (GW) - ',RegionsList(i));
        OutMatrixU((i-1)*28+2:i*28,:) = num2cell([t ; ones(1,length(t))*NaN ; U ; ones(1,length(t))*NaN]);
        %CF
        CF = handles.Scenario(k).CF(:,:,i)';
        OutMatrixCF((i-1)*28+1,1) = strcat('Capacity Factor - ',RegionsList(i));
        OutMatrixCF((i-1)*28+2:i*28,:) = num2cell([t ; ones(1,length(t))*NaN ; CF ; ones(1,length(t))*NaN]);
        %E
        E = handles.Scenario(k).HE(:,:,i)';
        OutMatrixE((i-1)*28+1,1) = strcat('CO2 Emissions (Mt) - ',RegionsList(i));
        OutMatrixE((i-1)*28+2:i*28,:) = num2cell([Ht ; ones(1,length(Ht))*NaN ; E ; ones(1,length(Ht))*NaN]);
        %LCOE
        LCOE = handles.Scenario(k).LCOE(:,:,i)';
        OutMatrixLCOE((i-1)*28+1,1) = strcat('LCOE ($/MWh) - ',RegionsList(i));
        OutMatrixLCOE((i-1)*28+2:i*28,:) = num2cell([t ; ones(1,length(t))*NaN ; LCOE ; ones(1,length(t))*NaN]);
        %TLCOE
        TLCOE = handles.Scenario(k).TLCOE(:,:,i)';
        OutMatrixTLCOE((i-1)*28+1,1) = strcat('LCOE including taxes/Subsidies ($/MWh) - ',RegionsList(i));
        OutMatrixTLCOE((i-1)*28+2:i*28,:) = num2cell([t ; ones(1,length(t))*NaN ; TLCOE ; ones(1,length(t))*NaN]);
        %LCOEs
        LCOEs = handles.Scenario(k).LCOEs(:,:,i)';
        OutMatrixLCOEs((i-1)*28+1,1) = strcat('LCOE without the carbon cost ($/MWh) - ',RegionsList(i));
        OutMatrixLCOEs((i-1)*28+2:i*28,:) = num2cell([t ; ones(1,length(t))*NaN ; LCOEs ; ones(1,length(t))*NaN]);
        %I
        I = handles.Scenario(k).I(:,:,i)';
        OutMatrixI((i-1)*28+1,1) = strcat('Investment (GW) - ',RegionsList(i));
        OutMatrixI((i-1)*28+2:i*28,:) = num2cell([t ; ones(1,length(t))*NaN ; I ; ones(1,length(t))*NaN]);
        %FCosts
        FCosts = handles.Scenario(k).FCosts(:,:,i)';
        OutMatrixFCosts((i-1)*28+1,1) = strcat('Fuel Costs ($/MWh) - ',RegionsList(i));
        OutMatrixFCosts((i-1)*28+2:i*28,:) = num2cell([t ; ones(1,length(t))*NaN ; FCosts ; ones(1,length(t))*NaN]);
        %ICosts
        ICosts = handles.Scenario(k).ICosts(:,:,i)';
        OutMatrixICosts((i-1)*28+1,1) = strcat('Investment Costs ($/MWh) - ',RegionsList(i));
        OutMatrixICosts((i-1)*28+2:i*28,:) = num2cell([t ; ones(1,length(t))*NaN ; ICosts ; ones(1,length(t))*NaN]);
        %CFCosts
        CFCosts = handles.Scenario(k).CFCosts(:,:,i)';
        OutMatrixCFCosts((i-1)*28+1,1) = strcat('Site quality cost ($/MWh) - ',RegionsList(i));
        OutMatrixCFCosts((i-1)*28+2:i*28,:) = num2cell([t ; ones(1,length(t))*NaN ; CFCosts ; ones(1,length(t))*NaN]);
        %CO2Costs
        CO2Costs = handles.Scenario(k).CO2Costs(:,:,i)';
        OutMatrixCO2Costs((i-1)*28+1,1) = strcat('Carbon Costs ($/MWh) - ',RegionsList(i));
        OutMatrixCO2Costs((i-1)*28+2:i*28,:) = num2cell([t ; ones(1,length(t))*NaN ; CO2Costs ; ones(1,length(t))*NaN]);
        %T
        T = handles.Scenario(k).T(:,:,i)';
        OutMatrixT((i-1)*28+1,1) = strcat('Taxes/Subsidies (% of LCOE) - ',RegionsList(i));
        OutMatrixT((i-1)*28+2:i*28,:) = num2cell([t ; ones(1,length(t))*NaN ; T ; ones(1,length(t))*NaN]);
    end
    %W is global
    W = handles.Scenario(k).W(:,:)';
    OutMatrixW(1,1) = strcat('Cumulative Capacity - ',RegionsList(i));
    OutMatrixW(2:28,:) = num2cell([t ; ones(1,length(t))*NaN ; W ; ones(1,length(t))*NaN]);
    %Save all sheets
    hw = waitbar(0,'Writing Text Files in progress'); i = 0; waitbar(i/15);
    cell2csv(strcat(ExportFileName,'_S.csv'),OutMatrixS,','); i = i + 1; waitbar(i/15);
    cell2csv(strcat(ExportFileName,'_HG.csv'),OutMatrixS,','); i = i + 1; waitbar(i/15);
    cell2csv(strcat(ExportFileName,'_U.csv'),OutMatrixS,','); i = i + 1; waitbar(i/15);
    cell2csv(strcat(ExportFileName,'_CF.csv'),OutMatrixS,','); i = i + 1; waitbar(i/15);
    cell2csv(strcat(ExportFileName,'_E.csv'),OutMatrixS,','); i = i + 1; waitbar(i/15);
    cell2csv(strcat(ExportFileName,'_LCOE.csv'),OutMatrixS,','); i = i + 1; waitbar(i/15);
    cell2csv(strcat(ExportFileName,'_TLCOE.csv'),OutMatrixS,','); i = i + 1; waitbar(i/15);
    cell2csv(strcat(ExportFileName,'_LCOEs.csv'),OutMatrixS,','); i = i + 1; waitbar(i/15);
    cell2csv(strcat(ExportFileName,'_I.csv'),OutMatrixS,','); i = i + 1; waitbar(i/15);
    cell2csv(strcat(ExportFileName,'_W.csv'),OutMatrixS,','); i = i + 1; waitbar(i/15);
    cell2csv(strcat(ExportFileName,'_FCosts.csv'),OutMatrixS,','); i = i + 1; waitbar(i/15);
    cell2csv(strcat(ExportFileName,'_ICosts.csv'),OutMatrixS,','); i = i + 1; waitbar(i/15);
    cell2csv(strcat(ExportFileName,'_CFCosts.csv'),OutMatrixS,','); i = i + 1; waitbar(i/15);
    cell2csv(strcat(ExportFileName,'_CO2Costs.csv'),OutMatrixS,','); i = i + 1; waitbar(i/15);
    cell2csv(strcat(ExportFileName,'_T.csv'),OutMatrixS,','); i = i + 1; waitbar(i/15);
    close(hw);
end
%cd ..

function SeedCrashButton_Callback(hObject, eventdata, handles)
%---Button that brings a dialog box telling the positions of the earliest NaNs in a
%---FTT crash
k = ScenarioNumber(handles);
FTTSeedCrashDlg(handles.Scenario(k));


%==========Find Gamma Section==============================================

function FindGamBut_Callback(hObject, eventdata, handles)

setappdata(0,'hFTT',gcf);
kk = ScenarioNumber(handles);

%For setting gamma we use the baseline data
setappdata(gcf,'DataScenario',handles.DataScenario(kk));
setappdata(gcf,'dt',handles.dt);
setappdata(gcf,'EndYear',handles.EndYear);
setappdata(gcf,'CostsFileName',[get(handles.PathField,'string') get(handles.CostsEdit,'string')]);
%setappdata(gcf,'kk',kk);
R = get(handles.RegListBox,'Value');
if length(R) == 1
    setappdata(gcf,'R',R);
else
    setappdata(gcf,'R',min(R));
end

handles.hSetGam = SetGamGUIv3;

% --- Executes on selection change in TechListBox.
function TechListBox_Callback(hObject, eventdata, handles)

% --- Executes on selection change in VarListBox.
function VarListBox_Callback(hObject, eventdata, handles)

%change classification in box
i = get(handles.VarListBox,'Value');
VarList = get(handles.VarListBox,'String');
VarName = VarList{i};
if strcmp(VarName,'JNJ')
    set(handles.TechListBox,'string',handles.FuelStr);
    set(handles.TechListBox,'value',1);
else
    set(handles.TechListBox,'string',handles.TechStr);
end

% --- Executes when selected object is changed in ScenarioSelector.
function ScenarioSelector_SelectionChangedFcn(hObject, eventdata, handles)
%Get list of variables as defined in the output structure of the calculation
k = ScenarioNumber(handles);
if k <= length(handles.Scenario)
    if ~isempty(handles.Scenario(k).S)
        VarList = fieldnames(handles.Scenario(k));
        %Set content of variables box
        set(handles.VarListBox,'string',VarList(3:end));
    end
end


%===============================================================================
%==========Useless functions below==============================================
%===============================================================================

function dtEdit_Callback(hObject, eventdata, handles)
% hObject    handle to dtEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of dtEdit as text
%        str2double(get(hObject,'String')) returns contents of dtEdit as a double


% --- Executes during object creation, after setting all properties.
function dtEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dtEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




function CostsEdit_Callback(hObject, eventdata, handles)
% hObject    handle to CostsEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of CostsEdit as text
%        str2double(get(hObject,'String')) returns contents of CostsEdit as a double


% --- Executes during object creation, after setting all properties.
function CostsEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to CostsEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function DemandEdit_Callback(hObject, eventdata, handles)
% hObject    handle to DemandEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of DemandEdit as text
%        str2double(get(hObject,'String')) returns contents of DemandEdit as a double


% --- Executes during object creation, after setting all properties.
function DemandEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to DemandEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function CSVHistoricalEdit_Callback(hObject, eventdata, handles)
% hObject    handle to CSVHistoricalEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of CSVHistoricalEdit as text
%        str2double(get(hObject,'String')) returns contents of CSVHistoricalEdit as a double


% --- Executes during object creation, after setting all properties.
function CSVHistoricalEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to CSVHistoricalEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function CSVScenarioEdit_Callback(hObject, eventdata, handles)
% hObject    handle to CSVScenarioEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of CSVScenarioEdit as text
%        str2double(get(hObject,'String')) returns contents of CSVScenarioEdit as a double


% --- Executes during object creation, after setting all properties.
function CSVScenarioEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to CSVScenarioEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function FigureEdit_Callback(hObject, eventdata, handles)
% hObject    handle to FigureEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of FigureEdit as text
%        str2double(get(hObject,'String')) returns contents of FigureEdit as a double


% --- Executes during object creation, after setting all properties.
function FigureEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FigureEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function AxesEdit_Callback(hObject, eventdata, handles)
% hObject    handle to AxesEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of AxesEdit as text
%        str2double(get(hObject,'String')) returns contents of AxesEdit as a double


% --- Executes during object creation, after setting all properties.
function AxesEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to AxesEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in P.
function P_Callback(hObject, eventdata, handles)
% hObject    handle to P (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of P


% --- Executes on button press in Depletion.
function Depletion_Callback(hObject, eventdata, handles)
% hObject    handle to Depletion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Depletion



function EndEdit_Callback(hObject, eventdata, handles)
% hObject    handle to EndEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EndEdit as text
%        str2double(get(hObject,'String')) returns contents of EndEdit as a double


% --- Executes during object creation, after setting all properties.
function EndEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EndEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function PolicyEdit_Callback(hObject, eventdata, handles)
% hObject    handle to PolicyEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PolicyEdit as text
%        str2double(get(hObject,'String')) returns contents of PolicyEdit as a double


% --- Executes during object creation, after setting all properties.
function PolicyEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PolicyEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function MaxScenarioEdit_Callback(hObject, eventdata, handles)
% hObject    handle to MaxScenarioEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of MaxScenarioEdit as text
%        str2double(get(hObject,'String')) returns contents of MaxScenarioEdit as a double


% --- Executes during object creation, after setting all properties.
function MaxScenarioEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MaxScenarioEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function SaveFileEdit_Callback(hObject, eventdata, handles)
% hObject    handle to SaveFileEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of SaveFileEdit as text
%        str2double(get(hObject,'String')) returns contents of SaveFileEdit as a double


% --- Executes during object creation, after setting all properties.
function SaveFileEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SaveFileEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end





function ExportFileEdit_Callback(hObject, eventdata, handles)
% hObject    handle to ExportFileEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ExportFileEdit as text
%        str2double(get(hObject,'String')) returns contents of ExportFileEdit as a double


% --- Executes during object creation, after setting all properties.
function ExportFileEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ExportFileEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ARBList_Callback(hObject, eventdata, handles)
% hObject    handle to ARBList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ARBList as text
%        str2double(get(hObject,'String')) returns contents of ARBList as a double


% --- Executes during object creation, after setting all properties.
function ARBList_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ARBList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function TechListBox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TechListBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in RegListBox.
function RegListBox_Callback(hObject, eventdata, handles)
% hObject    handle to RegListBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns RegListBox contents as cell array
%        contents{get(hObject,'Value')} returns selected item from RegListBox


% --- Executes during object creation, after setting all properties.
function RegListBox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RegListBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function VarListBox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to VarListBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


