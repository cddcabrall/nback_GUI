function varargout = mygui(varargin)
% MYGUI MATLAB code for mygui.fig
%      MYGUI, by itself, creates a new MYGUI or raises the existing
%      singleton*.
%
%      H = MYGUI returns the handle to a new MYGUI or the handle to
%      the existing singleton*.
%
%      MYGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MYGUI.M with the given input arguments.
%
%      MYGUI('Property','Value',...) creates a new MYGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before mygui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to mygui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help mygui

% Last Modified by GUIDE v2.5 03-Jun-2017 17:21:53

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @mygui_OpeningFcn, ...
                   'gui_OutputFcn',  @mygui_OutputFcn, ...
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


% --- Executes just before mygui is made visible.
function mygui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to mygui (see VARARGIN)

% Choose default command line output for mygui
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);
% UIWAIT makes mygui wait for user response (see UIRESUME)
% uiwait(handles.figureNBACK);



setappdata(0,'responses',[0])
setappdata(0,'runningScore',[0])
setappdata(0,'responsesTimes',[0])
setappdata(0,'targetChangeTimes',[0])
setappdata(0,'useN',0)

%hardcode for a default example table of target intervals and target values 
%a new default table can be loaded here (e.g., copy/paste)
cddc_default_itvTable = [4	6;
3.5	9;
2.5	8;
5	4;
2	7;
4.5	3;
3.5	5;
2	3;
4.5	4;
2	9;
2.5	1;
3	8;
4	9;
2	1;
5	6;
4	9;
4.5	6;
4.5	7;
5	4;
4	6;
4.5	5;
3	7;
3.5	6;
3	9;
5	3;
4	9;
4	8;
4.5	5;
4	7;
3.5	4;
2	6;
4.5	9;
2	6;
3.5	8;
3.5	1;
4	5;
3	8;
2	5;
5	9;
3	1;
2.5	8;
4.5	4;
4	4;
2.5	8;
4	7;
4	9;
4	5;
2.5	6;
3.5	5;
3	4;
2	7;
5	3;
4.5	5;
4	9;
5	4;
2.5	6;
3	5;
3.5	4;
4.5	8;
4	7;
2	2;
4.5	5;
2.5	9;
2	9;
4.5	7;
4	9;
3.5	4;
3.5	7;
4	3;
4.5	4;
2	2;
3	2;
3.5	3;
5	7;
2.5	9;
5	2;
3.5	8;
4.5	9;
5	3;
3	5;
4.5	9;
5	1;
4.5	7;
2.5	6;
4	7;
5	6;
3	3;
4	9;
5	3;
2	5;
2.5	8;
3	3;
2.5	2;
2.5	2;
5	9;
4.5	6;
3.5	5;
2	5;
2.5	3;
5	3;
4.5	4;
2	1;
4.5	4;
3.5	4;
4.5	8;
3.5	4;
5	1;
4	2;
3.5	6;
2.5	2;
3.5	5;
2	7;
4	3;
2.5	9;
3	6;
5	8;
2.5	4;
3.5	5;
3	6;
3	1;
2.5	1;
2.5	7;
2	4;
4	8;
3.5	2;
3.5	4;
3.5	6;
5	4;
2	8;
2	9;
2	5;
2	1;
3.5	6;
4	9;
2	1;
4.5	5;
3.5	2;
2.5	2;
5	5;
4	4;
3.5	8;
4	5;
3	8;
2.5	6;
4.5	9;
3	7;
3.5	9;
4.5	5;
5	1;
4.5	3;
2.5	8;
3.5	7;
3	6;
4	5;
5	6;
4	7;
4	5;
3	6;
5	5;
2	8;
2	2;
2.5	4;
3	2;
2.5	5;
3.5	9;
3	2;
3	6;
2.5	1;
2.5	5;
4	1;
4	2;
3	9;
2	1;
4.5	8;
4.5	3;
3.5	2;
2	2;
4.5	1;
5	4;
2.5	5;
3.5	2;
3.5	6;
2.5	3;
3	1;
4.5	2;
5	1;
4.5	5;
2	1;
2.5	5;
2.5	2;
2	8;
3.5	2;
4.5	8;
5	1;
3	9;
4	3;
4.5	3;
4	7;
5	1;
5	2;
5	4;
3	3;
3.5	8;
5	7;
3	6;
5	1;
3	6;
5	1;
3.5	3;
5	1;
5	9;
4	9;
4.5	6;
4	9;
4.5	3;
4.5	8;
3	5;
5	4;
3	7;
4	1;
4	4;
3.5	2;
4.5	5;
4.5	1;
2.5	1;
3.5	7;
5	1;
2.5	4;
4.5	8;
4	7;
3.5	5;
4	9;
3	7;
3	2;
5	8;
5	9;
3.5	6;
4.5	1;
2	7;
4	1;
4.5	7;
4.5	2;
3	2;
3	3;
2.5	9;
4	9;
2	1;
5	7;
3	1;
4	6;];
setappdata(0,'cddc_default_itvTable',cddc_default_itvTable)


assignin('base','intervalsAndTargets',cddc_default_itvTable);
setappdata(0,'intervalsAndTargets',cddc_default_itvTable)
setappdata(0,'intervals',cddc_default_itvTable(:,1));
setappdata(0,'targets',cddc_default_itvTable(:,2));

log_filename = ['log_NBT_'];
assignin('base','log_filename',log_filename);


%sound feedback definitions
f0 = 50;    y0 = sin(2*pi*f0*[0:0.001:0.5]);
f1 = 100;   y1 = sin(2*pi*f1*[0:0.001:0.5]);
f2 = 200;   y2 = sin(2*pi*f2*[0:0.001:0.5]);
f3 = 250;   y3 = sin(2*pi*f3*[0:0.001:0.5]);
f4 = 12;    y4 = sin(2*pi*f4*[0:0.001:0.5]);
f5 = 8;     y5 = sin(2*pi*f5*[0:0.001:0.5]);
f6 = 20;  y6 = sin(2*pi*f6*[0:0.001:0.5]);

beep_correct = [y0 y1 y2 y3]*100;
%beep_finish_good = [y0 y0]*100;
beep_incorrect = [y4 y5 y5 y5 y5 y5]*100;
%beep_start_bad = [y6]*100;

setappdata(0,'beep_correct',beep_correct)
setappdata(0,'beep_incorrect',beep_incorrect)






% --- Outputs from this function are returned to the command line.
function varargout = mygui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.responseNum,'String','1');

prevResponses = getappdata(0,'responses');
updatedResponses = [prevResponses 1];
setappdata(0,'responses',updatedResponses);

prevResponsesTimes = getappdata(0,'responsesTimes');
updatedResponsesTimes = [prevResponsesTimes now];
setappdata(0,'responsesTimes',updatedResponsesTimes);

useN = getappdata(0,'useN');
beep_correct = getappdata(0,'beep_correct');
beep_incorrect = getappdata(0,'beep_incorrect');

switch useN
        case 1
            if strcmp(num2str(1),(get(handles.txt1backDisp,'String')))
                sound(beep_correct);
            else
                sound(beep_incorrect);
            end
        case 2
            if strcmp(num2str(1),(get(handles.txt2backDisp,'String')))
                sound(beep_correct);
            else
                sound(beep_incorrect);
            end
        case 3
            if strcmp(num2str(1),(get(handles.txt3backDisp,'String')))
                sound(beep_correct);
            else
                sound(beep_incorrect);
            end
end


    




% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.responseNum,'String','2');

prevResponses = getappdata(0,'responses');
updatedResponses = [prevResponses 2];
setappdata(0,'responses',updatedResponses);

prevResponsesTimes = getappdata(0,'responsesTimes');
updatedResponsesTimes = [prevResponsesTimes now];
setappdata(0,'responsesTimes',updatedResponsesTimes);

useN = getappdata(0,'useN');
beep_correct = getappdata(0,'beep_correct');
beep_incorrect = getappdata(0,'beep_incorrect');

switch useN
        case 1
            if strcmp(num2str(2),(get(handles.txt1backDisp,'String')))
                sound(beep_correct);
            else
                sound(beep_incorrect);
            end
        case 2
            if strcmp(num2str(2),(get(handles.txt2backDisp,'String')))
                sound(beep_correct);
            else
                sound(beep_incorrect);
            end
        case 3
            if strcmp(num2str(2),(get(handles.txt3backDisp,'String')))
                sound(beep_correct);
            else
                sound(beep_incorrect);
            end
end



% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.responseNum,'String','3');

prevResponses = getappdata(0,'responses');
updatedResponses = [prevResponses 3];
setappdata(0,'responses',updatedResponses);

prevResponsesTimes = getappdata(0,'responsesTimes');
updatedResponsesTimes = [prevResponsesTimes now];
setappdata(0,'responsesTimes',updatedResponsesTimes);

useN = getappdata(0,'useN');
beep_correct = getappdata(0,'beep_correct');
beep_incorrect = getappdata(0,'beep_incorrect');

switch useN
        case 1
            if strcmp(num2str(3),(get(handles.txt1backDisp,'String')))
                sound(beep_correct);
            else
                sound(beep_incorrect);
            end
        case 2
            if strcmp(num2str(3),(get(handles.txt2backDisp,'String')))
                sound(beep_correct);
            else
                sound(beep_incorrect);
            end
        case 3
            if strcmp(num2str(3),(get(handles.txt3backDisp,'String')))
                sound(beep_correct);
            else
                sound(beep_incorrect);
            end
end





% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.responseNum,'String','4');

prevResponses = getappdata(0,'responses');
updatedResponses = [prevResponses 4];
setappdata(0,'responses',updatedResponses);

prevResponsesTimes = getappdata(0,'responsesTimes');
updatedResponsesTimes = [prevResponsesTimes now];
setappdata(0,'responsesTimes',updatedResponsesTimes);

useN = getappdata(0,'useN');
beep_correct = getappdata(0,'beep_correct');
beep_incorrect = getappdata(0,'beep_incorrect');

switch useN
        case 1
            if strcmp(num2str(4),(get(handles.txt1backDisp,'String')))
                sound(beep_correct);
            else
                sound(beep_incorrect);
            end
        case 2
            if strcmp(num2str(4),(get(handles.txt2backDisp,'String')))
                sound(beep_correct);
            else
                sound(beep_incorrect);
            end
        case 3
            if strcmp(num2str(4),(get(handles.txt3backDisp,'String')))
                sound(beep_correct);
            else
                sound(beep_incorrect);
            end
end



% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.responseNum,'String','5');

prevResponses = getappdata(0,'responses');
updatedResponses = [prevResponses 5];
setappdata(0,'responses',updatedResponses);

prevResponsesTimes = getappdata(0,'responsesTimes');
updatedResponsesTimes = [prevResponsesTimes now];
setappdata(0,'responsesTimes',updatedResponsesTimes);

useN = getappdata(0,'useN');
beep_correct = getappdata(0,'beep_correct');
beep_incorrect = getappdata(0,'beep_incorrect');

switch useN
        case 1
            if strcmp(num2str(5),(get(handles.txt1backDisp,'String')))
                sound(beep_correct);
            else
                sound(beep_incorrect);
            end
        case 2
            if strcmp(num2str(5),(get(handles.txt2backDisp,'String')))
                sound(beep_correct);
            else
                sound(beep_incorrect);
            end
        case 3
            if strcmp(num2str(5),(get(handles.txt3backDisp,'String')))
                sound(beep_correct);
            else
                sound(beep_incorrect);
            end
end



% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.responseNum,'String','6');

prevResponses = getappdata(0,'responses');
updatedResponses = [prevResponses 6];
setappdata(0,'responses',updatedResponses);

prevResponsesTimes = getappdata(0,'responsesTimes');
updatedResponsesTimes = [prevResponsesTimes now];
setappdata(0,'responsesTimes',updatedResponsesTimes);

useN = getappdata(0,'useN');
beep_correct = getappdata(0,'beep_correct');
beep_incorrect = getappdata(0,'beep_incorrect');

switch useN
        case 1
            if strcmp(num2str(6),(get(handles.txt1backDisp,'String')))
                sound(beep_correct);
            else
                sound(beep_incorrect);
            end
        case 2
            if strcmp(num2str(6),(get(handles.txt2backDisp,'String')))
                sound(beep_correct);
            else
                sound(beep_incorrect);
            end
        case 3
            if strcmp(num2str(6),(get(handles.txt3backDisp,'String')))
                sound(beep_correct);
            else
                sound(beep_incorrect);
            end
end



% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.responseNum,'String','7');

prevResponses = getappdata(0,'responses');
updatedResponses = [prevResponses 7];
setappdata(0,'responses',updatedResponses);

prevResponsesTimes = getappdata(0,'responsesTimes');
updatedResponsesTimes = [prevResponsesTimes now];
setappdata(0,'responsesTimes',updatedResponsesTimes);

useN = getappdata(0,'useN');
beep_correct = getappdata(0,'beep_correct');
beep_incorrect = getappdata(0,'beep_incorrect');

switch useN
        case 1
            if strcmp(num2str(7),(get(handles.txt1backDisp,'String')))
                sound(beep_correct);
            else
                sound(beep_incorrect);
            end
        case 2
            if strcmp(num2str(7),(get(handles.txt2backDisp,'String')))
                sound(beep_correct);
            else
                sound(beep_incorrect);
            end
        case 3
            if strcmp(num2str(7),(get(handles.txt3backDisp,'String')))
                sound(beep_correct);
            else
                sound(beep_incorrect);
            end
end



% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.responseNum,'String','8');

prevResponses = getappdata(0,'responses');
updatedResponses = [prevResponses 8];
setappdata(0,'responses',updatedResponses);

prevResponsesTimes = getappdata(0,'responsesTimes');
updatedResponsesTimes = [prevResponsesTimes now];
setappdata(0,'responsesTimes',updatedResponsesTimes);

useN = getappdata(0,'useN');
beep_correct = getappdata(0,'beep_correct');
beep_incorrect = getappdata(0,'beep_incorrect');

switch useN
        case 1
            if strcmp(num2str(8),(get(handles.txt1backDisp,'String')))
                sound(beep_correct);
            else
                sound(beep_incorrect);
            end
        case 2
            if strcmp(num2str(8),(get(handles.txt2backDisp,'String')))
                sound(beep_correct);
            else
                sound(beep_incorrect);
            end
        case 3
            if strcmp(num2str(8),(get(handles.txt3backDisp,'String')))
                sound(beep_correct);
            else
                sound(beep_incorrect);
            end
end



% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.responseNum,'String','9');

prevResponses = getappdata(0,'responses');
updatedResponses = [prevResponses 9];
setappdata(0,'responses',updatedResponses);

prevResponsesTimes = getappdata(0,'responsesTimes');
updatedResponsesTimes = [prevResponsesTimes now];
setappdata(0,'responsesTimes',updatedResponsesTimes);

useN = getappdata(0,'useN');
beep_correct = getappdata(0,'beep_correct');
beep_incorrect = getappdata(0,'beep_incorrect');

switch useN
        case 1
            if strcmp(num2str(9),(get(handles.txt1backDisp,'String')))
                sound(beep_correct);
            else
                sound(beep_incorrect);
            end
        case 2
            if strcmp(num2str(9),(get(handles.txt2backDisp,'String')))
                sound(beep_correct);
            else
                sound(beep_incorrect);
            end
        case 3
            if strcmp(num2str(9),(get(handles.txt3backDisp,'String')))
                sound(beep_correct);
            else
                sound(beep_incorrect);
            end
end


% --- Executes on button press in radiobutton0.
function radiobutton0_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton0


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2


% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton3


% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in btnExit.
function btnExit_Callback(hObject, eventdata, handles)
% hObject    handle to btnExit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%get the responses and store to output, 
%then assign in base, send to workspace
outResponses = getappdata(0,'responses');
assignin('base','outResponses',outResponses);

outScores = getappdata(0,'runningScore');
assignin('base','runningScore',outScores);
assignin('base','finalScore',sum(outScores));

outResponsesTimes = getappdata(0,'responsesTimes');
assignin('base','responsesTimes',outResponsesTimes);

outTargetChangeTimes = getappdata(0,'targetChangeTimes');
assignin('base','targetChangeTimes',outTargetChangeTimes);

pnum = get(handles.pnum_edit,'String');
ccode = get(handles.ccode_edit,'String');

res = struct('pnum',pnum,...
    'condition',ccode,...  
    'intervalsAndTargets',getappdata(0,'intervalsAndTargets'),...    
    'targetChangeTimes',outTargetChangeTimes,...
    'outResponses',outResponses,...
    'outResponsesTimes',outResponsesTimes,...
    'runningScore',outScores,...
    'finalScore',sum(outScores));
    
save(getappdata(0,'log_filename'),'res');

%delete the figure
delete(handles.figureNBACK);

%saveMe;


% --- Executes on button press in btnStart.
function btnStart_Callback(hObject, eventdata, handles)
% hObject    handle to btnStart (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%hide table of intervals and targets
%set(handles.uitable1,'Visible','off');

rnd = 1;

myCurrentScore = 0;
%set(handles.TotalScoreValue,'String','-000');
    
if strcmp(get(handles.pnum_edit,'String'),'p00') || strcmp(get(handles.ccode_edit,'String'),'EXP00')
    uiwait(msgbox({'check/change Participant Number and Condition Code' 'then press OK or X-Close msg in order to start'}));
    %set(mymsgbox, 'Position', [80 150 280 50])
end



format shortg
clo = clock;
log_filename = ['log_NBT_',num2str(clo(1)),'_',num2str(clo(2)),'_',num2str(clo(3)),'_',num2str(clo(4)),'_',num2str(clo(5)),'_',num2str(round(clo(6)))];
assignin('base','log_filename',log_filename);
setappdata(0,'log_filename',log_filename)

%sound feedback definitions
f0 = 50;    y0 = sin(2*pi*f0*[0:0.001:0.5]);
f1 = 100;   y1 = sin(2*pi*f1*[0:0.001:0.5]);
f2 = 200;   y2 = sin(2*pi*f2*[0:0.001:0.5]);
f3 = 250;   y3 = sin(2*pi*f3*[0:0.001:0.5]);
f4 = 12;    y4 = sin(2*pi*f4*[0:0.001:0.5]);
f5 = 8;     y5 = sin(2*pi*f5*[0:0.001:0.5]);
f6 = 20;  y6 = sin(2*pi*f6*[0:0.001:0.5]);

beep_correct = [y0 y1 y2 y3]*100;
%beep_finish_good = [y0 y0]*100;
beep_incorrect = [y4 y5 y5 y5 y5 y5]*100;
%beep_start_bad = [y6]*100;


%turn off the start button after it is first pressed
set(handles.btnStart,'Enable','off');

%turn off the create (table) button after start button is first pressed
set(handles.CreateTableBtn,'Enable','off');

%determine the n-back that is selected for, and set an 'n' variable
blah = get(handles.whatn,'SelectedObject');
nSelected = get(blah,'String');
useN = 0;

switch nSelected
    case '   from 1 time ago'
        useN = 1
    case '   from 2 times ago'
        useN = 2
    case '   from 3 times ago'
        useN = 3
end

setappdata(0,'useN',useN);

%turn off the n-back selection radiobuttons
set(handles.radiobutton1,'Enable','off');
set(handles.radiobutton2,'Enable','off');
set(handles.radiobutton3,'Enable','off');

%retrieve the intervals and targets from the stored appdata variables
my_intervals = getappdata(0,'intervals');
my_targets = getappdata(0,'targets');

%retrieve the previous responses from user and determine the last response
%prevResponses = getappdata(0,'responses');
%lastResponse = prevResponses(length(prevResponses));

%iterate over the full list of intervals
for i = (1:length(my_intervals))
    
    
    switch useN
        case 1
            set(handles.txt1backDisp,'String',num2str(my_targets(i)));
        case 2
            if i > 1
                set(handles.txt2backDisp,'String',num2str(my_targets(i-1)));
            end
        case 3
            if i > 2
                set(handles.txt3backDisp,'String',num2str(my_targets(i-2)));
            end
    end
    
    prevScores = getappdata(0,'runningScore');
   
    prevTargetChangeTimes = getappdata(0,'targetChangeTimes');
    updatedTargetChangeTimes = [prevTargetChangeTimes now];
    setappdata(0,'targetChangeTimes',updatedTargetChangeTimes);
    
    
    %set the target value text to the current target value
    set(handles.text3,'String',num2str(my_targets(i)));
    
    %%%%update value and display of current score
    %%%myCurrentScore = sum(prevScores);
    %%%set(handles.TotalScoreValue,'String',num2str(myCurrentScore));
    
    
    %pause for half of the current interval
    pause(my_intervals(i)/2);
     
    
    %remove the target value, by blocking with new string e.g. "?"
    set(handles.text3,'String','?????');
    

   
    %pause for half of the current interval
    pause(my_intervals(i)/2);
    
    %retrieve the previous responses from user and determine the last response
    prevResponses = getappdata(0,'responses');
    lastResponse = prevResponses(length(prevResponses));
    
    if i > useN
         if strcmp(num2str(lastResponse),num2str(my_targets(i-(useN-1))))
             %sound(beep_correct);
             updatedScores = [prevScores 1];
             setappdata(0,'runningScore',updatedScores);         
         else
             %sound(beep_incorrect);
             updatedScores = [prevScores -1];
             setappdata(0,'runningScore',updatedScores);
         end
    else
    end
    
   %update value and display of current score based on what round it is
   %hide the current score for first couple rounds as "practice"
    if rnd < 2
    
        set(handles.TotalScoreLabel,'String','Practice');
        myCurrentScore = sum(prevScores);
        set(handles.TotalScoreValue,'String','...');
    else
        set(handles.TotalScoreLabel,'String','Current score:');
        myCurrentScore = sum(prevScores);
        set(handles.TotalScoreValue,'String',num2str(myCurrentScore));
        
    end
 
%by the end of time limit for response... set the user response 
%to a deafult non response value, i.e. 0 which is scored as not correct
%avoid last user input being "right" by chance on a late trial
set(handles.responseNum,'String','0');
prevResponses = getappdata(0,'responses');
updatedResponses = [prevResponses 0];
setappdata(0,'responses',updatedResponses);
    
%increment the round counter
rnd = rnd + 1; 

end




% --- Executes on button press in answerToggle.
function answerToggle_Callback(hObject, eventdata, handles)
% hObject    handle to answerToggle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if strcmp(get(handles.txt1backDisp,'Visible'),'on')
    set(handles.txt1backDisp,'Visible','off');
    set(handles.txt2backDisp,'Visible','off');
    set(handles.txt3backDisp,'Visible','off');
    set(handles.AnswerIs_1,'Visible','off');
    set(handles.AnswerIs_2,'Visible','off');
    set(handles.AnswerIs_3,'Visible','off');
else
    set(handles.txt1backDisp,'Visible','on');
    set(handles.txt2backDisp,'Visible','on');
    set(handles.txt3backDisp,'Visible','on');
    set(handles.AnswerIs_1,'Visible','on');
    set(handles.AnswerIs_2,'Visible','on');
    set(handles.AnswerIs_3,'Visible','on');
end

    
    



function pnum_edit_Callback(hObject, eventdata, handles)
% hObject    handle to pnum_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pnum_edit as text
%        str2double(get(hObject,'String')) returns contents of pnum_edit as a double


% --- Executes during object creation, after setting all properties.
function pnum_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pnum_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ccode_edit_Callback(hObject, eventdata, handles)
% hObject    handle to ccode_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ccode_edit as text
%        str2double(get(hObject,'String')) returns contents of ccode_edit as a double


% --- Executes during object creation, after setting all properties.
function ccode_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ccode_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in RunViewMode_tgBtn.
function RunViewMode_tgBtn_Callback(hObject, eventdata, handles)
% hObject    handle to RunViewMode_tgBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of RunViewMode_tgBtn


% --- Executes on button press in SetupCntrls_tgBtn.
function SetupCntrls_tgBtn_Callback(hObject, eventdata, handles)
% hObject    handle to SetupCntrls_tgBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of SetupCntrls_tgBtn

%show/hide table calculated duration time
if strcmp(get(handles.calcMins_lbl,'Visible'),'on')
    set(handles.calcMins_lbl,'Visible','off');
else
    set(handles.calcMins_lbl,'Visible','on');
end
if strcmp(get(handles.calcMins_txt_val,'Visible'),'on')
    set(handles.calcMins_txt_val,'Visible','off');
else
    set(handles.calcMins_txt_val,'Visible','on');
end



%show/hide partcipant number
if strcmp(get(handles.text8,'Visible'),'on')
    set(handles.text8,'Visible','off');
else
    set(handles.text8,'Visible','on');
end

if strcmp(get(handles.pnum_edit,'Visible'),'on')
    set(handles.pnum_edit,'Visible','off');
else
    set(handles.pnum_edit,'Visible','on');
end



%show/hide condition code
if strcmp(get(handles.text9,'Visible'),'on')
    set(handles.text9,'Visible','off');
else
    set(handles.text9,'Visible','on');
end

if strcmp(get(handles.ccode_edit,'Visible'),'on')
    set(handles.ccode_edit,'Visible','off');
else
    set(handles.ccode_edit,'Visible','on');
end



%show/hide number of nbacks
if strcmp(get(handles.whatn,'Visible'),'on')
    set(handles.whatn,'Visible','off');
else
    set(handles.whatn,'Visible','on');
end



%show/hide answers button 
if strcmp(get(handles.answerToggle,'Visible'),'on')
    set(handles.answerToggle,'Visible','off');
else
    set(handles.answerToggle,'Visible','on');
end



%show/hide interval/target table button 
if strcmp(get(handles.TableToggle_tgBtn,'Visible'),'on')
    set(handles.TableToggle_tgBtn,'Visible','off');
else
    set(handles.TableToggle_tgBtn,'Visible','on');
end




%show/hide Last input response button
if strcmp(get(handles.UserResponse_tgBtn,'Visible'),'on')
    set(handles.UserResponse_tgBtn,'Visible','off');
else
    set(handles.UserResponse_tgBtn,'Visible','on');
end


%show/hide score button
if strcmp(get(handles.score_tgBtn,'Visible'),'on')
    set(handles.score_tgBtn,'Visible','off');
else
    set(handles.score_tgBtn,'Visible','on');
end



%show/hide start button
if strcmp(get(handles.btnStart,'Visible'),'on')
    set(handles.btnStart,'Visible','off');
else
    set(handles.btnStart,'Visible','on');
end



%show/hide exit button
if strcmp(get(handles.btnExit,'Visible'),'on')
    set(handles.btnExit,'Visible','off');
else
    set(handles.btnExit,'Visible','on');
end



%show/hide Target Values and Interval Settings panel
if strcmp(get(handles.TargetValIntervalSetting_Panel,'Visible'),'on')
    set(handles.TargetValIntervalSetting_Panel,'Visible','off');
else
    set(handles.TargetValIntervalSetting_Panel,'Visible','on');
end




% --- Executes on button press in UserResponse_tgBtn.
function UserResponse_tgBtn_Callback(hObject, eventdata, handles)
% hObject    handle to UserResponse_tgBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of UserResponse_tgBtn

if (get(hObject,'Value') == 1)
        set(handles.responseNum,'Visible','on');
        set(handles.LastInput_Lbl,'Visible','on');

else
        set(handles.responseNum,'Visible','off');
        set(handles.LastInput_Lbl,'Visible','off');

end







% --- Executes when entered data in editable cell(s) in uitable1.
function uitable1_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to uitable1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)

myTableData = get(hObject, 'data');

setappdata(0,'intervalsAndTargets',myTableData);

setappdata(0,'intervals',myTableData(:,1));
setappdata(0,'targets',myTableData(:,2));


% --- Executes on button press in TableToggle_tgBtn.
function TableToggle_tgBtn_Callback(hObject, eventdata, handles)
% hObject    handle to TableToggle_tgBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of TableToggle_tgBtn

if strcmp(get(handles.uitable1,'Visible'),'on')
    set(handles.uitable1,'Visible','off');
else
    set(handles.uitable1,'Visible','on');
end


% --- Executes on button press in score_tgBtn.
function score_tgBtn_Callback(hObject, eventdata, handles)
% hObject    handle to score_tgBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of score_tgBtn

%show/hide score label and score value
if (get(hObject,'Value') == 0)
    set(handles.TotalScoreLabel,'Visible','off');
else
    set(handles.TotalScoreLabel,'Visible','on');
end

%show/hide score button
if strcmp(get(handles.TotalScoreValue,'Visible'),'on')
    set(handles.TotalScoreValue,'Visible','off');
else
    set(handles.TotalScoreValue,'Visible','on');
end


% --- Executes on button press in CreateTableBtn.
function CreateTableBtn_Callback(hObject, eventdata, handles)
% hObject    handle to CreateTableBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%assign 0 values to selections for table target values, intervals, amounts
value_selection = 0;
interval_selection = 0;
amount_selection = 0;

%determine and store selection for target values
if (get(handles.TargetValueConstantBtn,'Value') == 1) & (get(handles.TargetValueRandomBtn,'Value') == 0) & (get(handles.TargetValuePreLoadBtn,'Value') == 0)
    value_selection = 1;
end
if (get(handles.TargetValueRandomBtn,'Value') == 1) & (get(handles.TargetValueConstantBtn,'Value') == 0) & (get(handles.TargetValuePreLoadBtn,'Value') == 0)
    value_selection = 2;
end
if (get(handles.TargetValuePreLoadBtn,'Value') == 1) & (get(handles.TargetValueConstantBtn,'Value') == 0) & (get(handles.TargetValueRandomBtn,'Value') == 0)
    value_selection = 3;
end

%determine and store selection for target interval
if (get(handles.TargetIntervalConstantBtn,'Value') == 1) & (get(handles.TargetIntervalRandomBtn,'Value') == 0) & (get(handles.TargetIntervalPreLoadBtn,'Value') == 0)
    interval_selection = 4;
end
if (get(handles.TargetIntervalRandomBtn,'Value') == 1) & (get(handles.TargetIntervalConstantBtn,'Value') == 0) & (get(handles.TargetIntervalPreLoadBtn,'Value') == 0)
    interval_selection = 5;
end
if (get(handles.TargetIntervalPreLoadBtn,'Value') == 1) & (get(handles.TargetIntervalConstantBtn,'Value') == 0) & (get(handles.TargetIntervalRandomBtn,'Value') == 0)
    interval_selection = 6;
end

%determine and store selection for target amount
if (get(handles.TargetAmountInputBtn,'Value') == 1) & (get(handles.TargetAmountPreLoadBtn,'Value') == 0) 
    amount_selection = 7;
end
if (get(handles.TargetAmountPreLoadBtn,'Value') == 1) & (get(handles.TargetAmountInputBtn,'Value') == 0) 
    amount_selection = 9;
end


% full logical combo list value, interval, amount
%case 1 = 1,4,7; case 2 = 1,5,7; case 3 = 1,6,7
%case 4 = 1,4,9; case 5 = 1,5,9; case 6 = 1,6,9
%case 7 = 2,4,7; case 8 = 2,5,7; case 9 = 2,6,7 
%case 10 = 2,4,9; case 11 = 2,5,9; case 12 = 2,6,9
%case 13 = 3,4,7; case 14 = 3,5,7; case 15 = 3,6,7
%case 16 = 3,4,9; case 17 = 3,5,9; case 18 = 3,6,9


%case 1,4,7
%CONSTANT values; CONSTANT intervals, INPUT amount
if (value_selection == 1 && interval_selection == 4 && amount_selection == 7)
    %determine target values of table
    spec_TargetValue = str2double(get(handles.TargetValueConstantEdtTxt,'String'));
    %determine intervals of table
    spec_Intervals = str2double(get(handles.TargetIntervalConstantEdtTxt,'String'));
    %determine size of table
    spec_tab_size = str2double(get(handles.TargetAmountInputEdtTxt,'String'));
    %make local empty tamp: values,intervals. and table
    temp_values = zeros(spec_tab_size,1);
    temp_intervals = zeros(spec_tab_size,1);
    local_temp_tab = zeros(spec_tab_size,2);
    %fill in appropriate values
    temp_values(:) = spec_TargetValue;
    %fill in appropriate intervals
    temp_intervals(:) = spec_Intervals;
    %fill in appropriate table
    local_temp_tab(:,2) = temp_values;
    local_temp_tab(:,1) = temp_intervals;
    %update global table, intervals, targets
    setappdata(0,'intervalsAndTargets',local_temp_tab)
    setappdata(0,'intervals',temp_intervals);
    setappdata(0,'targets',temp_values);
    %update gui table
    set(handles.uitable1,'data',local_temp_tab);
end


%case 1,5,7
%CONSTANT values; RANDOM intervals, INPUT amount
if (value_selection == 1 && interval_selection == 5 && amount_selection == 7)
    %determine target values of table
    spec_TargetValue = str2double(get(handles.TargetValueConstantEdtTxt,'String'));
    %determine intervals of table
    %retrieve the specified min and max 
    spec_min = get(handles.TargetIntervalConstant_Min_EdtTxt,'String');
    spec_min = str2double(spec_min);
    spec_max = get(handles.TargetIntervalConstant_Max_EdtTxt,'String');
    spec_max = str2double(spec_max);
    %determine size of table
    spec_tab_size = str2double(get(handles.TargetAmountInputEdtTxt,'String'));
    %make local empty tamp: values,intervals. and table
    temp_values = zeros(spec_tab_size,1);
    temp_intervals = zeros(spec_tab_size,1);
    local_temp_tab = zeros(spec_tab_size,2);
    %fill in appropriate values
    temp_values(:) = spec_TargetValue;
    %fill in appropriate intervals
    temp_intervals = randi([spec_min spec_max],spec_tab_size,1);
    %fill in appropriate table
    local_temp_tab(:,2) = temp_values;
    local_temp_tab(:,1) = temp_intervals;
    %update global table, intervals, targets
    setappdata(0,'intervalsAndTargets',local_temp_tab)
    setappdata(0,'intervals',temp_intervals);
    setappdata(0,'targets',temp_values);
    %update gui table
    set(handles.uitable1,'data',local_temp_tab);
end


%case 1,6,7
%CONSTANT values; PRELOAD intervals, INPUT amount
if (value_selection == 1 && interval_selection == 6 && amount_selection == 7)
    %determine target values of table
    spec_TargetValue = str2double(get(handles.TargetValueConstantEdtTxt,'String'));
    %determine size of table
    spec_tab_size = str2double(get(handles.TargetAmountInputEdtTxt,'String'));
    %make local empty tamp: values,intervals. and table
    temp_values = zeros(spec_tab_size,1);
    temp_intervals = zeros(spec_tab_size,1);
    local_temp_tab = zeros(spec_tab_size,2);
    %fill in appropriate values
    temp_values(:) = spec_TargetValue;
    
    %determine intervals of table
    %fill in appropriate intervals
    
    %retireve and store the pre load values and intervals 
    preload_Tab = getappdata(0,'cddc_default_itvTable');
    preLoadSize = size(preload_Tab,1);
    
    if spec_tab_size < preLoadSize
        relativeSize = 0;
    end
    if spec_tab_size == preLoadSize
        relativeSize = 1;
    end
    if spec_tab_size > preLoadSize
        relativeSize = 2;
    end
    
        switch relativeSize
        case 0
            %set_of_preLoadVals = local_cddc_def_itvTable(1:tempTabSize,2);
            set_of_preLoadIntervals = preload_Tab(1:spec_tab_size,1);
        case 1
            %set_of_preLoadVals = local_cddc_def_itvTable(:,2);
            set_of_preLoadIntervals = preload_Tab(:,1);
            
        case 2
            
            set_of_preLoadIntervals = zeros(spec_tab_size,1);
            %set_of_preLoadVals = zeros(tempTabSize,1);
            %determine how many full times larger
            fulltimesLarger = floor(spec_tab_size/preLoadSize);
            %loop start
            for rnd_i = 1:fulltimesLarger
                 startplace = (preLoadSize * (rnd_i - 1))+1;
                 %fill the full pre-load into spaces according to round
                 %set_of_preLoadVals(startplace:(preLoadSize*rnd_i)) = local_cddc_def_itvTable(1:preLoadSize,2);
                 set_of_preLoadIntervals(startplace:(preLoadSize*rnd_i)) = preload_Tab(1:preLoadSize,1);       
           end  
           startplace = startplace + preLoadSize;

           %determine new partial excess
           partial_excess =  spec_tab_size - (fulltimesLarger * preLoadSize);
           %last append
           %set_of_preLoadVals (startplace:length(set_of_preLoadVals))  = local_cddc_def_itvTable(1:partial_excess,2);
           set_of_preLoadIntervals (startplace:length(set_of_preLoadIntervals))  = preload_Tab(1:partial_excess,1);
    end
        
     %fill in appropriate table
    local_temp_tab(:,2) = temp_values;
    local_temp_tab(:,1) = set_of_preLoadIntervals;
    %update global table, intervals, targets
    setappdata(0,'intervalsAndTargets',local_temp_tab)
    setappdata(0,'intervals',temp_intervals);
    setappdata(0,'targets',temp_values);
    %update gui table
    set(handles.uitable1,'data',local_temp_tab);
end


%case 1,4,9
%CONSTANT values; CONSTANT intervals, PRELOAD amount
if (value_selection == 1 && interval_selection == 4 && amount_selection == 9)
    %determine target values of table
    spec_TargetValue = str2double(get(handles.TargetValueConstantEdtTxt,'String'));
    %determine intervals of table
    spec_Intervals = str2double(get(handles.TargetIntervalConstantEdtTxt,'String'));
    %determine size of table
    local_temp_tab = getappdata(0,'cddc_default_itvTable');
    spec_tab_size = size(local_temp_tab,1);
    %make local empty tamp: values,intervals. and table
    temp_values = zeros(spec_tab_size,1);
    temp_intervals = zeros(spec_tab_size,1);
    local_temp_tab = zeros(spec_tab_size,2);
    %fill in appropriate values
    temp_values(:) = spec_TargetValue;
    %fill in appropriate intervals
    temp_intervals(:) = spec_Intervals;
    %fill in appropriate table
    local_temp_tab(:,2) = temp_values;
    local_temp_tab(:,1) = temp_intervals;
    %update global table, intervals, targets
    setappdata(0,'intervalsAndTargets',local_temp_tab)
    setappdata(0,'intervals',temp_intervals);
    setappdata(0,'targets',temp_values);
    %update gui table
    set(handles.uitable1,'data',local_temp_tab);
end


%case 1,5,9
%CONSTANT values; RANDOM intervals, PRELOAD amount
if (value_selection == 1 && interval_selection == 5 && amount_selection == 9)
    %determine target values of table
    spec_TargetValue = str2double(get(handles.TargetValueConstantEdtTxt,'String'));
    %determine intervals of table
    %retrieve the specified min and max 
    spec_min = get(handles.TargetIntervalConstant_Min_EdtTxt,'String');
    spec_min = str2double(spec_min);
    spec_max = get(handles.TargetIntervalConstant_Max_EdtTxt,'String');
    spec_max = str2double(spec_max);
    %determine size of table
    local_temp_tab = getappdata(0,'cddc_default_itvTable');
    spec_tab_size = size(local_temp_tab,1);
    %make local empty tamp: values,intervals. and table
    temp_values = zeros(spec_tab_size,1);
    temp_intervals = zeros(spec_tab_size,1);
    local_temp_tab = zeros(spec_tab_size,2);
    %fill in appropriate values
    temp_values(:) = spec_TargetValue;
    %fill in appropriate intervals
    temp_intervals = randi([spec_min spec_max],spec_tab_size,1);
    %fill in appropriate table
    local_temp_tab(:,2) = temp_values;
    local_temp_tab(:,1) = temp_intervals;
    %update global table, intervals, targets
    setappdata(0,'intervalsAndTargets',local_temp_tab)
    setappdata(0,'intervals',temp_intervals);
    setappdata(0,'targets',temp_values);
    %update gui table
    set(handles.uitable1,'data',local_temp_tab);
end


%case 1,6,9
%CONSTANT values; PRELOAD intervals; PRELOAD amount
if (value_selection == 1 && interval_selection == 6 && amount_selection == 9)
    %make a new local temp table, and load it with the preload
    local_temp_tab = zeros(1,2);
    local_temp_tab = getappdata(0,'cddc_default_itvTable');
    %determine size of intervals/values
    size_tab = size(local_temp_tab,1);
    %create temp intervals/values arrays
    temp_intervals = zeros(size_tab,1);
    temp_values = zeros(size_tab,1);
    %fill in appropriate intervals
    temp_intervals = local_temp_tab(:,1);
    %fill in appropriate VALUES
    spec_TargetValue = str2double(get(handles.TargetValueConstantEdtTxt,'String'));
    temp_values(:) = spec_TargetValue;
    %update local table
    local_temp_tab(:,1) = temp_intervals;
    local_temp_tab(:,2) = temp_values;
    %update global table, intervals, targets
    setappdata(0,'intervalsAndTargets',local_temp_tab)
    setappdata(0,'intervals',temp_intervals);
    setappdata(0,'targets',temp_values);
    %update gui table
    set(handles.uitable1,'data',local_temp_tab);
end


%case 2,4,7
%RANDOM values; CONSTANT intervals, INPUT amount
if (value_selection == 2 && interval_selection == 4 && amount_selection == 7)
    %determine target intervals of table
    spec_Intervals = str2double(get(handles.TargetIntervalConstantEdtTxt,'String'));
    %determine values of table
    %retrieve the specified min and max 
    spec_min = get(handles.TargetValueConstant_Min_EdtTxt,'String');
    spec_min = str2double(spec_min);
    spec_max = get(handles.TargetValueConstant_Max_EdtTxt,'String');
    spec_max = str2double(spec_max);
     %determine size of table
    spec_tab_size = str2double(get(handles.TargetAmountInputEdtTxt,'String'));
    %make local empty tamp: values, intervals, and table
    temp_values = zeros(spec_tab_size,1);
    temp_intervals = zeros(spec_tab_size,1);
    local_temp_tab = zeros(spec_tab_size,2);
    %fill in appropriate values
    temp_values = randi([spec_min spec_max],spec_tab_size,1);
    %fill in appropriate intervals
    temp_intervals(:) = spec_Intervals; 
    %fill in appropriate table
    local_temp_tab(:,2) = temp_values;
    local_temp_tab(:,1) = temp_intervals;
    %update global table, intervals, targets
    setappdata(0,'intervalsAndTargets',local_temp_tab)
    setappdata(0,'intervals',temp_intervals);
    setappdata(0,'targets',temp_values);
    %update gui table
    set(handles.uitable1,'data',local_temp_tab);   
end


%case 2,5,7
%RANDOM values; RANDOM intervals, INPUT amount
if (value_selection == 2 && interval_selection == 5 && amount_selection == 7)
    %determine values of table
    %retrieve the specified min and max 
    spec_min = get(handles.TargetValueConstant_Min_EdtTxt,'String');
    spec_min = str2double(spec_min);
    spec_max = get(handles.TargetValueConstant_Max_EdtTxt,'String');
    spec_max = str2double(spec_max);
     %determine intervals of table
    %retrieve the specified min and max 
    spec_min2 = get(handles.TargetIntervalConstant_Min_EdtTxt,'String');
    spec_min2 = str2double(spec_min2);
    spec_max2 = get(handles.TargetIntervalConstant_Max_EdtTxt,'String');
    spec_max2 = str2double(spec_max2);
    %determine size of table
    spec_tab_size = str2double(get(handles.TargetAmountInputEdtTxt,'String'));
    %make local empty tamp: values, intervals, and table
    temp_values = zeros(spec_tab_size,1);
    temp_intervals = zeros(spec_tab_size,1);
    local_temp_tab = zeros(spec_tab_size,2);
    %fill in appropriate values
    temp_values = randi([spec_min spec_max],spec_tab_size,1);
    %fill in appropriate intervals
    temp_intervals = randi([spec_min2 spec_max2],spec_tab_size,1);
    %fill in appropriate table
    local_temp_tab(:,2) = temp_values;
    local_temp_tab(:,1) = temp_intervals;
    %update global table, intervals, targets
    setappdata(0,'intervalsAndTargets',local_temp_tab)
    setappdata(0,'intervals',temp_intervals);
    setappdata(0,'targets',temp_values);
    %update gui table
    set(handles.uitable1,'data',local_temp_tab);   
end

%case 2,6,7
%RANDOM values; PRELOAD intervals, INPUT amount
if (value_selection == 2 && interval_selection == 6 && amount_selection == 7)
    %determine target values of table
    %retrieve the specified min and max 
    spec_min = get(handles.TargetValueConstant_Min_EdtTxt,'String');
    spec_min = str2double(spec_min);
    spec_max = get(handles.TargetValueConstant_Max_EdtTxt,'String');
    spec_max = str2double(spec_max);
    
    
    %determine size of table
    spec_tab_size = str2double(get(handles.TargetAmountInputEdtTxt,'String'));
    %make local empty tamp: values,intervals. and table
    temp_values = zeros(spec_tab_size,1);
    temp_intervals = zeros(spec_tab_size,1);
    local_temp_tab = zeros(spec_tab_size,2);
    %fill in appropriate values
    temp_values = randi([spec_min spec_max],spec_tab_size,1);
    
    %determine intervals of table
    %fill in appropriate intervals
    
    %retireve and store the pre load values and intervals 
    preload_Tab = getappdata(0,'cddc_default_itvTable');
    preLoadSize = size(preload_Tab,1);
  
    if spec_tab_size < preLoadSize
        relativeSize = 0;
    end
    if spec_tab_size == preLoadSize
        relativeSize = 1;
    end
    if spec_tab_size > preLoadSize
        relativeSize = 2;
    end
    
        switch relativeSize
        case 0
            %set_of_preLoadVals = local_cddc_def_itvTable(1:tempTabSize,2);
            set_of_preLoadIntervals = preload_Tab(1:spec_tab_size,1);
        case 1
            %set_of_preLoadVals = local_cddc_def_itvTable(:,2);
            set_of_preLoadIntervals = preload_Tab(:,1);
        case 2
            set_of_preLoadIntervals = zeros(spec_tab_size,1);
            %set_of_preLoadVals = zeros(tempTabSize,1);
            %determine how many full times larger
            fulltimesLarger = floor(spec_tab_size/preLoadSize);
            %loop start
            for rnd_i = 1:fulltimesLarger
                 startplace = (preLoadSize * (rnd_i - 1))+1;
                 %fill the full pre-load into spaces according to round
                 %set_of_preLoadVals(startplace:(preLoadSize*rnd_i)) = local_cddc_def_itvTable(1:preLoadSize,2);
                 set_of_preLoadIntervals(startplace:(preLoadSize*rnd_i)) = preload_Tab(1:preLoadSize,1);       
           end  
           startplace = startplace + preLoadSize;
           %determine new partial excess
           partial_excess =  spec_tab_size - (fulltimesLarger * preLoadSize);
           %last append
           %set_of_preLoadVals (startplace:length(set_of_preLoadVals))  = local_cddc_def_itvTable(1:partial_excess,2);
           set_of_preLoadIntervals (startplace:length(set_of_preLoadIntervals))  = preload_Tab(1:partial_excess,1);
        end
     
     %fill in appropriate table
    local_temp_tab(:,2) = temp_values;
    local_temp_tab(:,1) = set_of_preLoadIntervals;
    %update global table, intervals, targets
    setappdata(0,'intervalsAndTargets',local_temp_tab)
    setappdata(0,'intervals',set_of_preLoadIntervals);
    setappdata(0,'targets',temp_values);
    %update gui table
    set(handles.uitable1,'data',local_temp_tab);
end


%case 2,4,9
%RANDOM values; CONSTANT intervals, PRELOAD amount
if (value_selection == 2 && interval_selection == 4 && amount_selection == 9)
    %determine target values of table
    %retrieve the specified min and max 
    spec_min = get(handles.TargetValueConstant_Min_EdtTxt,'String');
    spec_min = str2double(spec_min);
    spec_max = get(handles.TargetValueConstant_Max_EdtTxt,'String');
    spec_max = str2double(spec_max);
    %determine intervals of table
    spec_Intervals = str2double(get(handles.TargetIntervalConstantEdtTxt,'String'));
    %determine size of table
    local_temp_tab = getappdata(0,'cddc_default_itvTable');
    spec_tab_size = size(local_temp_tab,1);
    %make local empty tamp: values,intervals. and table
    temp_values = zeros(spec_tab_size,1);
    temp_intervals = zeros(spec_tab_size,1);
    local_temp_tab = zeros(spec_tab_size,2);
    %fill in appropriate values
    temp_values = randi([spec_min spec_max],spec_tab_size,1);
    %fill in appropriate intervals
    temp_intervals(:) = spec_Intervals;
    %fill in appropriate table
    local_temp_tab(:,2) = temp_values;
    local_temp_tab(:,1) = temp_intervals;
    %update global table, intervals, targets
    setappdata(0,'intervalsAndTargets',local_temp_tab)
    setappdata(0,'intervals',temp_intervals);
    setappdata(0,'targets',temp_values);
    %update gui table
    set(handles.uitable1,'data',local_temp_tab);
end


%case 2,5,9
%RANDOM values; RANDOM intervals, PRELOAD amount
if (value_selection == 2 && interval_selection == 5 && amount_selection == 9)
    %determine target values of table
    %retrieve the specified min and max 
    spec_min = get(handles.TargetValueConstant_Min_EdtTxt,'String');
    spec_min = str2double(spec_min);
    spec_max = get(handles.TargetValueConstant_Max_EdtTxt,'String');
    spec_max = str2double(spec_max);
    %determine intervals of table
    %retrieve the specified min and max 
    spec_min2 = get(handles.TargetIntervalConstant_Min_EdtTxt,'String');
    spec_min2 = str2double(spec_min2);
    spec_max2 = get(handles.TargetIntervalConstant_Max_EdtTxt,'String');
    spec_max2 = str2double(spec_max2);
    %determine size of table
    local_temp_tab = getappdata(0,'cddc_default_itvTable');
    spec_tab_size = size(local_temp_tab,1);
    %make local empty tamp: values,intervals. and table
    temp_values = zeros(spec_tab_size,1);
    temp_intervals = zeros(spec_tab_size,1);
    local_temp_tab = zeros(spec_tab_size,2);
    %fill in appropriate values
    temp_values = randi([spec_min spec_max],spec_tab_size,1);
    %fill in appropriate intervals
    temp_intervals = randi([spec_min2 spec_max2],spec_tab_size,1);
    %fill in appropriate table
    local_temp_tab(:,2) = temp_values;
    local_temp_tab(:,1) = temp_intervals;
    %update global table, intervals, targets
    setappdata(0,'intervalsAndTargets',local_temp_tab)
    setappdata(0,'intervals',temp_intervals);
    setappdata(0,'targets',temp_values);
    %update gui table
    set(handles.uitable1,'data',local_temp_tab);
end

%case 2,6,9
%RANDOM values; PRELOAD intervals; PRELOAD amounts
if (value_selection == 2 && interval_selection == 6 && amount_selection == 9)
    %make a new local temp table, and load it with the preload
    local_temp_tab = zeros(1,2);
    local_temp_tab = getappdata(0,'cddc_default_itvTable');
    %determine size of intervals/values
    size_tab = size(local_temp_tab,1);
    %create temp intervals/values arrays
    temp_intervals = zeros(size_tab,1);
    temp_values = zeros(size_tab,1);
    %fill in appropriate intervals
    temp_intervals = local_temp_tab(:,1);
    %fill in appropriate VALUES
    %retrieve the specified min and max 
    spec_min = get(handles.TargetValueConstant_Min_EdtTxt,'String');
    spec_min = str2double(spec_min);
    spec_max = get(handles.TargetValueConstant_Max_EdtTxt,'String');
    spec_max = str2double(spec_max);
    spec_TargetValue = randi([spec_min spec_max],size_tab,1);
    temp_values = spec_TargetValue;
    %update local table
    local_temp_tab(:,1) = temp_intervals;
    local_temp_tab(:,2) = temp_values;
    %update global table, intervals, targets
    setappdata(0,'intervalsAndTargets',local_temp_tab)
    setappdata(0,'intervals',temp_intervals);
    setappdata(0,'targets',temp_values);
    %update gui table
    set(handles.uitable1,'data',local_temp_tab);
end


%case 3,4,7
%PRELOAD values; CONSTANT intervals, INPUT amount
if (value_selection == 3 && interval_selection == 4 && amount_selection == 7)
    %determine size of table
    spec_tab_size = str2double(get(handles.TargetAmountInputEdtTxt,'String'));
    %make local empty tamp: values,intervals. and table
    temp_values = zeros(spec_tab_size,1);
    temp_intervals = zeros(spec_tab_size,1);
    local_temp_tab = zeros(spec_tab_size,2);
    %fill in appropriate intervals
    temp_Intervals = str2double(get(handles.TargetIntervalConstantEdtTxt,'String'));
    
    %determine values of table
    %fill in appropriate values
    %retireve and store the pre load values and intervals 
    preload_Tab = getappdata(0,'cddc_default_itvTable');
    preLoadSize = size(preload_Tab,1);
  
    if spec_tab_size < preLoadSize
        relativeSize = 0;
    end
    if spec_tab_size == preLoadSize
        relativeSize = 1;
    end
    if spec_tab_size > preLoadSize
        relativeSize = 2;
    end
    
        switch relativeSize
        case 0
            set_of_preLoadVals  = preload_Tab(1:spec_tab_size,2);
        case 1
            set_of_preLoadVals = preload_Tab(:,2);
        case 2
            set_of_preLoadVals = zeros(spec_tab_size,1);
            %determine how many full times larger
            fulltimesLarger = floor(spec_tab_size/preLoadSize);
            %loop start
            for rnd_i = 1:fulltimesLarger
                 startplace = (preLoadSize * (rnd_i - 1))+1;
                 %fill the full pre-load into spaces according to round
                 set_of_preLoadVals(startplace:(preLoadSize*rnd_i)) = preload_Tab(1:preLoadSize,2);       
           end  
           startplace = startplace + preLoadSize;
           %determine new partial excess
           partial_excess =  spec_tab_size - (fulltimesLarger * preLoadSize);
           %last append
           set_of_preLoadVals (startplace:length(set_of_preLoadVals))  = preload_Tab(1:partial_excess,2);
        end

     %fill in appropriate table
    local_temp_tab(:,1) = temp_Intervals;
    local_temp_tab(:,2) = set_of_preLoadVals;
    %update global table, intervals, targets
    setappdata(0,'intervalsAndTargets',local_temp_tab)
    setappdata(0,'intervals',local_temp_tab(:,1));
    setappdata(0,'targets',set_of_preLoadVals);
    %update gui table
    set(handles.uitable1,'data',local_temp_tab);
end


%case 3,5,7
%PRELOAD values; RANDOM intervals, INPUT amount
if (value_selection == 3 && interval_selection == 5 && amount_selection == 7)
    %determine size of table
    spec_tab_size = str2double(get(handles.TargetAmountInputEdtTxt,'String'));
    %make local empty tamp: values,intervals. and table
    temp_values = zeros(spec_tab_size,1);
    temp_intervals = zeros(spec_tab_size,1);
    local_temp_tab = zeros(spec_tab_size,2);
    %fill in appropriate intervals
     %retrieve the specified min and max 
    spec_min = get(handles.TargetIntervalConstant_Min_EdtTxt,'String');
    spec_min = str2double(spec_min);
    spec_max = get(handles.TargetIntervalConstant_Max_EdtTxt,'String');
    spec_max = str2double(spec_max);
    temp_Intervals = randi([spec_min spec_max],spec_tab_size,1);
    
    %determine values of table
    %fill in appropriate values
    %retireve and store the pre load values and intervals 
    preload_Tab = getappdata(0,'cddc_default_itvTable');
    preLoadSize = size(preload_Tab,1);
  
    if spec_tab_size < preLoadSize
        relativeSize = 0;
    end
    if spec_tab_size == preLoadSize
        relativeSize = 1;
    end
    if spec_tab_size > preLoadSize
        relativeSize = 2;
    end
    
        switch relativeSize
        case 0
            set_of_preLoadVals  = preload_Tab(1:spec_tab_size,2);
        case 1
            set_of_preLoadVals = preload_Tab(:,2);
        case 2
            set_of_preLoadVals = zeros(spec_tab_size,1);
            %determine how many full times larger
            fulltimesLarger = floor(spec_tab_size/preLoadSize);
            %loop start
            for rnd_i = 1:fulltimesLarger
                 startplace = (preLoadSize * (rnd_i - 1))+1;
                 %fill the full pre-load into spaces according to round
                 set_of_preLoadVals(startplace:(preLoadSize*rnd_i)) = preload_Tab(1:preLoadSize,2);       
           end  
           startplace = startplace + preLoadSize;
           %determine new partial excess
           partial_excess =  spec_tab_size - (fulltimesLarger * preLoadSize);
           %last append
           set_of_preLoadVals (startplace:length(set_of_preLoadVals))  = preload_Tab(1:partial_excess,2);
        end

     %fill in appropriate table
    local_temp_tab(:,1) = temp_Intervals;
    local_temp_tab(:,2) = set_of_preLoadVals;
    %update global table, intervals, targets
    setappdata(0,'intervalsAndTargets',local_temp_tab)
    setappdata(0,'intervals',local_temp_tab(:,1));
    setappdata(0,'targets',local_temp_tab(:,2));
    %update gui table
    set(handles.uitable1,'data',local_temp_tab);
end


%case 3,6,7
%PRELOAD values; PRELOAD intervals, INPUT amount
if (value_selection == 3 && interval_selection == 6 && amount_selection == 7)
    %determine size of table
    spec_tab_size = str2double(get(handles.TargetAmountInputEdtTxt,'String'));
    %make local empty tamp: values,intervals. and table
    temp_values = zeros(spec_tab_size,1);
    temp_intervals = zeros(spec_tab_size,1);
    local_temp_tab = zeros(spec_tab_size,2);
   
    %determine values/intervals of table
    %fill in appropriate values/intervals
    %retireve and store the pre load values and intervals 
    preload_Tab = getappdata(0,'cddc_default_itvTable');
    preLoadSize = size(preload_Tab,1);
  
    if spec_tab_size < preLoadSize
        relativeSize = 0;
    end
    if spec_tab_size == preLoadSize
        relativeSize = 1;
    end
    if spec_tab_size > preLoadSize
        relativeSize = 2;
    end
    
        switch relativeSize
        case 0
            set_of_preLoadVals  = preload_Tab(1:spec_tab_size,2);
            set_of_preLoadIntervals  = preload_Tab(1:spec_tab_size,1);
        case 1
            set_of_preLoadVals = preload_Tab(:,2);
            set_of_preLoadIntervals = preload_Tab(:,1);
        case 2
            set_of_preLoadVals = zeros(spec_tab_size,1);
            set_of_preLoadIntervals = zeros(spec_tab_size,1);
                       
            %determine how many full times larger
            fulltimesLarger = floor(spec_tab_size/preLoadSize);
            %loop start
            for rnd_i = 1:fulltimesLarger
                 startplace = (preLoadSize * (rnd_i - 1))+1;
                 %fill the full pre-load into spaces according to round
                 set_of_preLoadVals(startplace:(preLoadSize*rnd_i)) = preload_Tab(1:preLoadSize,2);
                 set_of_preLoadIntervals(startplace:(preLoadSize*rnd_i)) = preload_Tab(1:preLoadSize,1); 
           end  
           startplace = startplace + preLoadSize;
           %determine new partial excess
           partial_excess =  spec_tab_size - (fulltimesLarger * preLoadSize);
           %last append
           set_of_preLoadVals (startplace:length(set_of_preLoadVals))  = preload_Tab(1:partial_excess,2);
           set_of_preLoadIntervals (startplace:length(set_of_preLoadIntervals))  = preload_Tab(1:partial_excess,1);
        end

     %fill in appropriate table
    local_temp_tab(:,1) = set_of_preLoadIntervals;
    local_temp_tab(:,2) = set_of_preLoadVals;
    %update global table, intervals, targets
    setappdata(0,'intervalsAndTargets',local_temp_tab)
    setappdata(0,'intervals',local_temp_tab(:,1));
    setappdata(0,'targets',local_temp_tab(:,2));
    %update gui table
    set(handles.uitable1,'data',local_temp_tab);
end


%case 3,4,9
%PRELOAD values; CONSTANT intervals, PRELOAD amount
if (value_selection == 3 && interval_selection == 4 && amount_selection == 9)
    %determine target values from preload
    %make a new local temp table, and load it with the preload
    local_temp_tab = zeros(1,2);
    local_temp_tab = getappdata(0,'cddc_default_itvTable');   
     %determine target intervals of table
    spec_Intervals = str2double(get(handles.TargetIntervalConstantEdtTxt,'String'));
    %determine size of intervals/values
    size_tab = size(local_temp_tab,1);
    %create temp intervals/values arrays
    temp_intervals = zeros(size_tab,1);
    temp_values = zeros(size_tab,1);
    %fill in appropriate intervals/values
    temp_intervals(:) = spec_Intervals; 
    temp_values = local_temp_tab(:,2);
    %update local table
    local_temp_tab(:,1) = temp_intervals;
    local_temp_tab(:,2) = temp_values;
    %update global table, intervals, targets
    setappdata(0,'intervalsAndTargets',local_temp_tab)
    setappdata(0,'intervals',temp_intervals);
    setappdata(0,'targets',temp_values);
    %update gui table
    set(handles.uitable1,'data',local_temp_tab);
end


%case 3,5,9
%PRELOAD values; RANDOM intervals, PRELOAD amount
if (value_selection == 3 && interval_selection == 5 && amount_selection == 9)
    %determine target values from preload
    %make a new local temp table, and load it with the preload
    local_temp_tab = zeros(1,2);
    local_temp_tab = getappdata(0,'cddc_default_itvTable');   
    %determine intervals of table
    %retrieve the specified min and max 
    spec_min = get(handles.TargetIntervalConstant_Min_EdtTxt,'String');
    spec_min = str2double(spec_min);
    spec_max = get(handles.TargetIntervalConstant_Max_EdtTxt,'String');
    spec_max = str2double(spec_max);
    %determine size of intervals/values
    size_tab = size(local_temp_tab,1);
    %create temp intervals/values arrays
    temp_intervals = zeros(size_tab,1);
    temp_values = zeros(size_tab,1);
    %fill in appropriate intervals/values
    temp_intervals = randi([spec_min spec_max],size_tab,1);
    temp_values = local_temp_tab(:,2);
    %update local table
    local_temp_tab(:,1) = temp_intervals;
    local_temp_tab(:,2) = temp_values;
    %update global table, intervals, targets
    setappdata(0,'intervalsAndTargets',local_temp_tab)
    setappdata(0,'intervals',temp_intervals);
    setappdata(0,'targets',temp_values);
    %update gui table
    set(handles.uitable1,'data',local_temp_tab);
end


%case 3,6,9
%FULL PRELOAD values, intervals, and amounts
if (value_selection == 3 && interval_selection == 6 && amount_selection == 9)
    %make a new local temp table, and load it with the preload
    local_temp_tab = zeros(1,2);
    local_temp_tab = getappdata(0,'cddc_default_itvTable');
    %determine size of intervals/values
    size_tab = size(local_temp_tab,1);
    %create temp intervals/values arrays
    temp_intervals = zeros(size_tab,1);
    temp_values = zeros(size_tab,1);
    %fill in appropriate intervals/values
    temp_intervals = local_temp_tab(:,1);
    temp_values = local_temp_tab(:,2);
    %update local table
    local_temp_tab(:,1) = temp_intervals;
    local_temp_tab(:,2) = temp_values;
    %update global table, intervals, targets
    setappdata(0,'intervalsAndTargets',local_temp_tab)
    setappdata(0,'intervals',temp_intervals);
    setappdata(0,'targets',temp_values);
    %update gui table
    set(handles.uitable1,'data',local_temp_tab);
end


%compute and display total amount of time Nback table will provide   
set(handles.calcMins_lbl,'Visible','on');
set(handles.calcMins_txt_val,'Visible','on');
theIntervals = getappdata(0,'intervals');   
set(handles.calcMins_txt_val,'String',num2str(roundn((sum(theIntervals)/60),-2)));

%check that options are selected at each step, else through error msg box
if value_selection ~= 1 & value_selection ~= 2 & value_selection ~= 3
msgbox('please select an option for Step 1) Values of Targets');
end
if interval_selection ~= 4 & interval_selection ~= 5 & interval_selection ~= 6
msgbox('please select an option for Step 2) Intervals between Targets');
end
if amount_selection  ~= 7 & amount_selection ~= 9
msgbox('please select an option for Step 3) Amount of Targets');
end


% --- Executes on button press in TargetValueConstantBtn.
function TargetValueConstantBtn_Callback(hObject, eventdata, handles)
% hObject    handle to TargetValueConstantBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of TargetValueConstantBtn

if (get(hObject,'Value') == 1)
    set(handles.TargetValueConstantEdtTxt,'Visible','on');
    set(handles.TargetValueConstant_lbl,'Visible','on');
    
    set(handles.TargetValueRandomBtn,'Value',0);
    set(handles.TargetValueRandom_Min_lbl,'Visible','off');
    set(handles.TargetValueRandom_Max_lbl,'Visible','off');
    set(handles.TargetValueConstant_Min_EdtTxt,'Visible','off');
    set(handles.TargetValueConstant_Max_EdtTxt,'Visible','off');
    set(handles.TargetValueRandom_lbl,'Visible','off');
    
    set(handles.TargetValuePreLoadBtn,'Value',0);
    set(handles.TargetValueLoadCDDC_lbl,'Visible','off');
    
    
else
    set(handles.TargetValueConstantEdtTxt,'Visible','off');
    set(handles.TargetValueConstant_lbl,'Visible','off');
end


% --- Executes on button press in TargetValueRandomBtn.
function TargetValueRandomBtn_Callback(hObject, eventdata, handles)
% hObject    handle to TargetValueRandomBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of TargetValueRandomBtn

if (get(hObject,'Value') == 1)
    set(handles.TargetValueRandom_Min_lbl,'Visible','on');
    set(handles.TargetValueRandom_Max_lbl,'Visible','on');
    set(handles.TargetValueConstant_Min_EdtTxt,'Visible','on');
    set(handles.TargetValueConstant_Max_EdtTxt,'Visible','on');
    set(handles.TargetValueRandom_lbl,'Visible','on');
    
    set(handles.TargetValuePreLoadBtn,'Value',0);
    set(handles.TargetValueLoadCDDC_lbl,'Visible','off');
    
    set(handles.TargetValueConstantBtn,'Value',0);
    set(handles.TargetValueConstantEdtTxt,'Visible','off');
    set(handles.TargetValueConstant_lbl,'Visible','off');
    
else
    set(handles.TargetValueRandom_Min_lbl,'Visible','off');
    set(handles.TargetValueRandom_Max_lbl,'Visible','off');
    set(handles.TargetValueConstant_Min_EdtTxt,'Visible','off');
    set(handles.TargetValueConstant_Max_EdtTxt,'Visible','off');
    set(handles.TargetValueRandom_lbl,'Visible','off');
    
end


% --- Executes on button press in TargetValuePreLoadBtn.
function TargetValuePreLoadBtn_Callback(hObject, eventdata, handles)
% hObject    handle to TargetValuePreLoadBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of TargetValuePreLoadBtn

if (get(hObject,'Value') == 1)
    set(handles.TargetValueLoadCDDC_lbl,'Visible','on');
    
    set(handles.TargetValueRandomBtn,'Value',0);
    set(handles.TargetValueRandom_Min_lbl,'Visible','off');
    set(handles.TargetValueRandom_Max_lbl,'Visible','off');
    set(handles.TargetValueConstant_Min_EdtTxt,'Visible','off');
    set(handles.TargetValueConstant_Max_EdtTxt,'Visible','off');
    set(handles.TargetValueRandom_lbl,'Visible','off');
    
    set(handles.TargetValueConstantBtn,'Value',0);
    set(handles.TargetValueConstantEdtTxt,'Visible','off');
    set(handles.TargetValueConstant_lbl,'Visible','off');   
    
else
    set(handles.TargetValueLoadCDDC_lbl,'Visible','off');
end

% --- Executes on button press in TargetIntervalConstantBtn.
function TargetIntervalConstantBtn_Callback(hObject, eventdata, handles)
% hObject    handle to TargetIntervalConstantBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of TargetIntervalConstantBtn

if (get(hObject,'Value') == 1)
    set(handles.TargetIntervalConstantEdtTxt,'Visible','on');
    set(handles.TargetIntervalConstant_lbl,'Visible','on');
    
    set(handles.TargetIntervalPreLoadBtn,'Value',0);
    set(handles.TargetIntervalLoadCDDC_lbl,'Visible','off');
    
    set(handles.TargetIntervalRandomBtn,'Value',0);    
    set(handles.TargetIntervalRandom_Min_lbl,'Visible','off');
    set(handles.TargetIntervalRandom_Max_lbl,'Visible','off');
    set(handles.TargetIntervalConstant_Min_EdtTxt,'Visible','off');
    set(handles.TargetIntervalConstant_Max_EdtTxt,'Visible','off');
    set(handles.TargetIntervalRandom_lbl,'Visible','off');
        
else
    set(handles.TargetIntervalConstantEdtTxt,'Visible','off');
    set(handles.TargetIntervalConstant_lbl,'Visible','off');
end

% --- Executes on button press in TargetIntervalRandomBtn.
function TargetIntervalRandomBtn_Callback(hObject, eventdata, handles)
% hObject    handle to TargetIntervalRandomBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of TargetIntervalRandomBtn

if (get(hObject,'Value') == 1)
    set(handles.TargetIntervalRandom_Min_lbl,'Visible','on');
    set(handles.TargetIntervalRandom_Max_lbl,'Visible','on');
    set(handles.TargetIntervalConstant_Min_EdtTxt,'Visible','on');
    set(handles.TargetIntervalConstant_Max_EdtTxt,'Visible','on');
    set(handles.TargetIntervalRandom_lbl,'Visible','on');
    
        set(handles.TargetIntervalPreLoadBtn,'Value',0);
        set(handles.TargetIntervalLoadCDDC_lbl,'Visible','off');
        
        set(handles.TargetIntervalConstantBtn,'Value',0);
        set(handles.TargetIntervalConstantEdtTxt,'Visible','off');
        set(handles.TargetIntervalConstant_lbl,'Visible','off');
        
else
    set(handles.TargetIntervalRandom_Min_lbl,'Visible','off');
    set(handles.TargetIntervalRandom_Max_lbl,'Visible','off');
    set(handles.TargetIntervalConstant_Min_EdtTxt,'Visible','off');
    set(handles.TargetIntervalConstant_Max_EdtTxt,'Visible','off');
    set(handles.TargetIntervalRandom_lbl,'Visible','off');

end


% --- Executes on button press in TargetIntervalPreLoadBtn.
function TargetIntervalPreLoadBtn_Callback(hObject, eventdata, handles)
% hObject    handle to TargetIntervalPreLoadBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of TargetIntervalPreLoadBtn

if (get(hObject,'Value') == 1)
    set(handles.TargetIntervalLoadCDDC_lbl,'Visible','on');
    
    set(handles.TargetIntervalRandomBtn,'Value',0);
    set(handles.TargetIntervalRandom_Min_lbl,'Visible','off');
    set(handles.TargetIntervalRandom_Max_lbl,'Visible','off');
    set(handles.TargetIntervalConstant_Min_EdtTxt,'Visible','off');
    set(handles.TargetIntervalConstant_Max_EdtTxt,'Visible','off');
    set(handles.TargetIntervalRandom_lbl,'Visible','off');
    
    set(handles.TargetIntervalConstantBtn,'Value',0);
    set(handles.TargetIntervalConstantEdtTxt,'Visible','off');
    set(handles.TargetIntervalConstant_lbl,'Visible','off');
    
else
    set(handles.TargetIntervalLoadCDDC_lbl,'Visible','off');
    
end

% --- Executes on button press in TargetAmountPreLoadBtn.
function TargetAmountPreLoadBtn_Callback(hObject, eventdata, handles)
% hObject    handle to TargetAmountPreLoadBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of TargetAmountPreLoadBtn

if (get(hObject,'Value') == 1)
    set(handles.TargetAmountLoadCDDC_lbl_1,'Visible','on');
    set(handles.TargetAmountLoadCDDC_lbl_2,'Visible','on');
    set(handles.TargetAmountLoadCDDC_lbl_3,'Visible','on');
    
   %auto deselect input target amount
  set(handles.TargetAmountInputBtn,'Value',0);
  set(handles.TargetAmountInputEdtTxt,'Visible','off');
  set(handles.TargetAmountInput_lbl_1,'Visible','off');
  set(handles.TargetAmountInput_lbl_2,'Visible','off');
  set(handles.TargetAmountInput_lbl_3,'Visible','off');
    
else
    set(handles.TargetAmountLoadCDDC_lbl_1,'Visible','off');
    set(handles.TargetAmountLoadCDDC_lbl_2,'Visible','off');
    set(handles.TargetAmountLoadCDDC_lbl_3,'Visible','off');
    
       %auto select input target amount
  set(handles.TargetAmountInputBtn,'Value',1);
  set(handles.TargetAmountInputEdtTxt,'Visible','on');
  set(handles.TargetAmountInput_lbl_1,'Visible','on');
  set(handles.TargetAmountInput_lbl_2,'Visible','on');
  set(handles.TargetAmountInput_lbl_3,'Visible','on');
    
end






% --- Executes on button press in TargetAmountInputBtn.
function TargetAmountInputBtn_Callback(hObject, eventdata, handles)
% hObject    handle to TargetAmountInputBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of TargetAmountInputBtn

if (get(hObject,'Value') == 1)
    set(handles.TargetAmountInputEdtTxt,'Visible','on');
    set(handles.TargetAmountInput_lbl_1,'Visible','on');
    set(handles.TargetAmountInput_lbl_2,'Visible','on');
    set(handles.TargetAmountInput_lbl_3,'Visible','on');
    
     %auto deselect pre-load amount
   set(handles.TargetAmountPreLoadBtn,'Value',0);
   set(handles.TargetAmountLoadCDDC_lbl_1,'Visible','off');
   set(handles.TargetAmountLoadCDDC_lbl_2,'Visible','off');
   set(handles.TargetAmountLoadCDDC_lbl_3,'Visible','off');

else
    set(handles.TargetAmountInputEdtTxt,'Visible','off');
    set(handles.TargetAmountInput_lbl_1,'Visible','off');
    set(handles.TargetAmountInput_lbl_2,'Visible','off');
    set(handles.TargetAmountInput_lbl_3,'Visible','off');
    
    %auto select pre-load amount
    set(handles.TargetAmountPreLoadBtn,'Value',1)
    set(handles.TargetAmountLoadCDDC_lbl_1,'Visible','on');
    set(handles.TargetAmountLoadCDDC_lbl_2,'Visible','on');
    set(handles.TargetAmountLoadCDDC_lbl_3,'Visible','on');
end


function TargetAmountInputEdtTxt_Callback(hObject, eventdata, handles)
% hObject    handle to TargetAmountInputEdtTxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TargetAmountInputEdtTxt as text
%        str2double(get(hObject,'String')) returns contents of TargetAmountInputEdtTxt as a double


% --- Executes during object creation, after setting all properties.
function TargetAmountInputEdtTxt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TargetAmountInputEdtTxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function TargetIntervalConstantEdtTxt_Callback(hObject, eventdata, handles)
% hObject    handle to TargetIntervalConstantEdtTxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TargetIntervalConstantEdtTxt as text
%        str2double(get(hObject,'String')) returns contents of TargetIntervalConstantEdtTxt as a double


% --- Executes during object creation, after setting all properties.
function TargetIntervalConstantEdtTxt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TargetIntervalConstantEdtTxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes during object creation, after setting all properties.
function TargetIntervalConstant_Min_EdtTxt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TargetIntervalConstant_Min_EdtTxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes during object creation, after setting all properties.
function TargetIntervalConstant_Max_EdtTxt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TargetIntervalConstant_Max_EdtTxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes during object creation, after setting all properties.
function TargetValueConstantEdtTxt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TargetValueConstantEdtTxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes during object creation, after setting all properties.
function TargetValueConstant_Min_EdtTxt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TargetValueConstant_Min_EdtTxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes during object creation, after setting all properties.
function TargetValueConstant_Max_EdtTxt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TargetValueConstant_Max_EdtTxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in zerosTable.
function zerosTable_Callback(hObject, eventdata, handles)
% hObject    handle to zerosTable (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

thisTable = zeros(250,2);
setappdata(0,'intervals',thisTable(:,1));
setappdata(0,'targets',thisTable(:,2));
set(handles.uitable1,'data',thisTable);

