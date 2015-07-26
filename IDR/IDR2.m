function varargout = IDR2(varargin)
% IDR MATLAB code for IDR.fig
%      IDR, by itself, creates a new IDR or raises the existing
%      singleton*.
%
%      H = IDR returns the handle to a new IDR or the handle to
%      the existing singleton*.
%
%      IDR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IDR.M with the given input arguments.
%
%      IDR('Property','Value',...) creates a new IDR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before IDR2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to IDR2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help IDR

% Last Modified by GUIDE v2.5 04-Jun-2014 08:43:45

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @IDR2_OpeningFcn, ...
                   'gui_OutputFcn',  @IDR2_OutputFcn, ...
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


% --- Executes just before IDR is made visible.
function IDR2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to IDR (see VARARGIN)

% Choose default command line output for IDR
movegui(hObject,'southeast');
handles.output = hObject;
set(handles.choixSNR,'Visible','off');
set(handles.staticSNR,'Visible','off');
set(handles.staticJitter,'Visible','off');
set(handles.choixJitter,'Visible','off');
set(handles.truc,'Visible','off');
set(handles.panelReconstruction,'Visible','off');
set(handles.choixFreq2,'Visible','off');
set(handles.staticFreq2,'Visible','off');
set(handles.staticSymbol,'Visible','off');
set(handles.choixSymbol,'Visible','off');
set(handles.staticAmpl2,'Visible','off');
set(handles.choixAmpl2,'Visible','off');

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes IDR wait for user response (see UIRESUME)
% uiwait(handles.idr);


% --- Outputs from this function are returned to the command line.
function varargout = IDR2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in choixSignal.
function choixSignal_Callback(hObject, eventdata, handles)
% hObject    handle to choixSignal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns choixSignal contents as cell array
%        contents{get(hObject,'Value')} returns selected item from choixSignal
switch get(hObject,'Value') %Dynamisme du panneau "avancé"

  case 1, set(handles.choixFreq2,'Visible','off');
          set(handles.staticFreq2,'Visible','off');
          set(handles.staticSymbol,'Visible','off');
          set(handles.choixSymbol,'Visible','off');
          set(handles.staticAmpl2,'Visible','off');
          set(handles.choixAmpl2,'Visible','off');
          set(handles.choixFreq,'Visible','on');
          set(handles.staticFreq,'Visible','on');
          set(handles.staticAmpl,'Visible','on');
          set(handles.choixAmpl,'Visible','on');

  case 2, set(handles.choixFreq2,'Visible','off');
          set(handles.staticFreq2,'Visible','off');
          set(handles.staticSymbol,'Visible','on');
          set(handles.choixSymbol,'Visible','on');
          set(handles.staticAmpl2,'Visible','off');
          set(handles.choixAmpl2,'Visible','off');
          set(handles.choixFreq,'Visible','on');
          set(handles.staticFreq,'Visible','on');
          set(handles.staticAmpl,'Visible','on');
          set(handles.choixAmpl,'Visible','on');

  case 3, set(handles.staticAmpl2,'Visible','on');
          set(handles.choixAmpl2,'Visible','on');
          set(handles.choixFreq2,'Visible','off');
          set(handles.staticFreq2,'Visible','off');
          set(handles.staticSymbol,'Visible','on');
          set(handles.choixSymbol,'Visible','on');
          set(handles.choixFreq,'Visible','on');
          set(handles.staticFreq,'Visible','on');
          set(handles.staticAmpl,'Visible','on');
          set(handles.choixAmpl,'Visible','on');

  case 4, set(handles.choixFreq2,'Visible','on');
          set(handles.staticFreq2,'Visible','on');
          set(handles.staticSymbol,'Visible','on');
          set(handles.choixSymbol,'Visible','on');
          set(handles.staticAmpl2,'Visible','off');
          set(handles.choixAmpl2,'Visible','off');
          set(handles.choixFreq,'Visible','on');
          set(handles.staticFreq,'Visible','on');
          set(handles.staticAmpl,'Visible','on');
          set(handles.choixAmpl,'Visible','on');

  case 5, set(handles.choixFreq2,'Visible','off');
          set(handles.staticFreq2,'Visible','off');
          set(handles.staticSymbol,'Visible','on');
          set(handles.choixSymbol,'Visible','on');
          set(handles.staticAmpl2,'Visible','off');
          set(handles.choixAmpl2,'Visible','off');
          set(handles.choixFreq,'Visible','on');
          set(handles.staticFreq,'Visible','on');
          set(handles.staticAmpl,'Visible','on');
          set(handles.choixAmpl,'Visible','on');

  case 6, set(handles.choixFreq,'Visible','off');
          set(handles.staticFreq,'Visible','off');
          set(handles.choixFreq2,'Visible','off');
          set(handles.staticFreq2,'Visible','off');
          set(handles.staticSymbol,'Visible','on');
          set(handles.choixSymbol,'Visible','on');
          set(handles.staticAmpl2,'Visible','off');
          set(handles.choixAmpl2,'Visible','off');
          set(handles.staticAmpl,'Visible','on');
          set(handles.choixAmpl,'Visible','on');

  case 7, set(handles.choixFreq,'Visible','off');
          set(handles.staticFreq,'Visible','off');
          set(handles.choixFreq2,'Visible','off');
          set(handles.staticFreq2,'Visible','off');
          set(handles.staticSymbol,'Visible','on');
          set(handles.choixSymbol,'Visible','on');
          set(handles.staticAmpl2,'Visible','off');
          set(handles.choixAmpl2,'Visible','off');
          set(handles.staticAmpl,'Visible','on');
          set(handles.choixAmpl,'Visible','on');
  
  case 8, set(handles.choixFreq,'Visible','off');
          set(handles.staticFreq,'Visible','off');
          set(handles.choixFreq2,'Visible','off');
          set(handles.staticFreq2,'Visible','off');
          set(handles.staticSymbol,'Visible','on');
          set(handles.choixSymbol,'Visible','on');
          set(handles.staticAmpl2,'Visible','off');
          set(handles.choixAmpl2,'Visible','off');
          set(handles.staticAmpl,'Visible','on');
          set(handles.choixAmpl,'Visible','on');

  case 9, set(handles.choixFreq2,'Visible','off');
          set(handles.staticFreq2,'Visible','off');
          set(handles.staticSymbol,'Visible','on');
          set(handles.choixSymbol,'Visible','on');
          set(handles.staticAmpl2,'Visible','off');
          set(handles.choixAmpl2,'Visible','off');
          set(handles.choixFreq,'Visible','on');
          set(handles.staticFreq,'Visible','on');
          set(handles.staticAmpl,'Visible','off');
          set(handles.choixAmpl,'Visible','off');

  case 10, set(handles.choixFreq2,'Visible','off');
          set(handles.staticFreq2,'Visible','off');
          set(handles.staticSymbol,'Visible','off');
          set(handles.choixSymbol,'Visible','off');
          set(handles.staticAmpl2,'Visible','off');
          set(handles.choixAmpl2,'Visible','off');
          set(handles.choixFreq,'Visible','off');
          set(handles.staticFreq,'Visible','off');
          set(handles.staticAmpl,'Visible','off');
          set(handles.choixAmpl,'Visible','off');
  
  otherwise set(handles.choixFreq,'Visible','off');
            set(handles.staticFreq,'Visible','off');
            set(handles.choixFreq2,'Visible','off');
            set(handles.staticFreq2,'Visible','off');
            set(handles.staticSymbol,'Visible','off');
            set(handles.choixSymbol,'Visible','off');
            set(handles.staticAmpl2,'Visible','off');
            set(handles.choixAmpl2,'Visible','off');
            set(handles.staticAmpl,'Visible','off');
            set(handles.choixAmpl,'Visible','off');

end


% --- Executes during object creation, after setting all properties.
function choixSignal_CreateFcn(hObject, eventdata, handles)
% hObject    handle to choixSignal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in ajoutBruitBlanc2.
function ajoutBruitBlanc2_Callback(hObject, eventdata, handles)
% hObject    handle to ajoutBruitBlanc2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ajoutBruitBlanc2

if get(hObject,'Value')==1
     set(handles.choixSNR,'Visible','on');
     set(handles.staticSNR,'Visible','on');
else set(handles.choixSNR,'Visible','off');
     set(handles.staticSNR,'Visible','off');
end

function choixSNR_Callback(hObject, eventdata, handles)
% hObject    handle to choixSNR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of choixSNR as text
%        str2double(get(hObject,'String')) returns contents of choixSNR as a double


% --- Executes during object creation, after setting all properties.
function choixSNR_CreateFcn(hObject, eventdata, handles)
% hObject    handle to choixSNR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in choixReconstruction.
function choixReconstruction_Callback(hObject, eventdata, handles)
% hObject    handle to choixReconstruction (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns choixReconstruction contents as cell array
%        contents{get(hObject,'Value')} returns selected item from choixReconstruction


% --- Executes during object creation, after setting all properties.
function choixReconstruction_CreateFcn(hObject, eventdata, handles)
% hObject    handle to choixReconstruction (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in choixEchantillonnage.
function choixEchantillonnage_Callback(hObject, eventdata, handles)
% hObject    handle to choixEchantillonnage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns choixEchantillonnage contents as cell array
%        contents{get(hObject,'Value')} returns selected item from choixEchantillonnage

%Dynamisme jitter + reconstruction
switch get(hObject,'Value')
    case 1, set(handles.staticJitter,'Visible','off');
            set(handles.choixJitter,'Visible','off');
            set(handles.truc,'Visible','off');
            set(handles.panelReconstruction,'Visible','off');
    case 2, set(handles.staticJitter,'Visible','on');
            set(handles.choixJitter,'Visible','on');
            set(handles.truc,'Visible','on');
            set(handles.panelReconstruction,'Visible','on');
    otherwise '';
end

% --- Executes during object creation, after setting all properties.
function choixEchantillonnage_CreateFcn(hObject, eventdata, handles)
% hObject    handle to choixEchantillonnage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function choixFreqEch_Callback(hObject, eventdata, handles)
% hObject    handle to choixFreqEch (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of choixFreqEch as text
%        str2double(get(hObject,'String')) returns contents of choixFreqEch as a double

% --- Executes during object creation, after setting all properties.
function choixFreqEch_CreateFcn(hObject, eventdata, handles)
% hObject    handle to choixFreqEch (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function choixJitter_Callback(hObject, eventdata, handles)
% hObject    handle to choixJitter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of choixJitter as text
%        str2double(get(hObject,'String')) returns contents of choixJitter as a double


% --- Executes during object creation, after setting all properties.
function choixJitter_CreateFcn(hObject, eventdata, handles)
% hObject    handle to choixJitter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function about_Callback(hObject, eventdata, handles)
% hObject    handle to about (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on key press with focus on choixSNR and none of its controls.
function choixSNR_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to choixSNR (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)



function choixFreq_Callback(hObject, eventdata, handles)
% hObject    handle to choixFreq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of choixFreq as text
%        str2double(get(hObject,'String')) returns contents of choixFreq as a double


% --- Executes during object creation, after setting all properties.
function choixFreq_CreateFcn(hObject, eventdata, handles)
% hObject    handle to choixFreq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function choixFreq2_Callback(hObject, eventdata, handles)
% hObject    handle to choixFreq2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of choixFreq2 as text
%        str2double(get(hObject,'String')) returns contents of choixFreq2 as a double


% --- Executes during object creation, after setting all properties.
function choixFreq2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to choixFreq2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in lancerSimulation.
function lancerSimulation_Callback(hObject, eventdata, handles)
% hObject    handle to lancerSimulation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%x=0:0.01:10;
%%
%%Récupération des données spécifiés
freqEch=str2double(get(handles.choixFreqEch,'String'));
freqEch=freqEch*10^3;
nombreDePoints=str2double(get(handles.choixNbrPts,'String'));
pourcentageJitter=str2double(get(handles.choixJitter,'String'))/100;
freq=str2double(get(handles.choixFreq,'String'));
freq=freq*10^3;
freq2=str2double(get(handles.choixFreq2,'String'));
freq2=freq2*10^3;
ampl=str2double(get(handles.choixAmpl,'String'));
ampl2=str2double(get(handles.choixAmpl2,'String'));
nombreSymbole=str2double(get(handles.choixSymbol,'String'));
%%
%%Creation des instants uniformes
instantsUniform=0:(1/freqEch):(nombreDePoints-1)/freqEch;
setappdata(0,'uniform',instantsUniform);

%%Choix instants uniformes ou non-uniformes
switch get(handles.choixEchantillonnage,'Value')
    case 1, instants=instantsUniform;
    case 2, matrixEps=(pourcentageJitter/(2*freqEch))*(2*rand(nombreDePoints,1)-1); %jitter de loi uniforme
            instants=instantsUniform+matrixEps';    %creation temps non uniforme
            setappdata(0,'nonuniform',instants);
    otherwise '';
end

switch get(handles.choixSignal,'Value')
    case 1, signal=ampl*sin(2*pi*freq*instantsUniform);

    case 2, signal=ampl*(QPSK(instantsUniform',nombreSymbole,freqEch,freq))';

    case 3, signal=(ASK(instantsUniform',nombreSymbole,freqEch,ampl,ampl2,freq))';
    
    case 4, signal=(FSK(nombreSymbole,ampl,instantsUniform',freqEch,freq,freq2))';

    case 5, signal=ampl*BPSK(freq,nombreSymbole,instantsUniform');

    case 6, signal=ampl*(RZ(instantsUniform',nombreSymbole,freqEch))';

    case 7, signal=ampl*(NRZ(instantsUniform',nombreSymbole,freqEch))';
    
    case 8, signal=ampl*(Manchester(instantsUniform',nombreSymbole,freqEch))';

    case 9, signal=ampl*(QAM(instantsUniform',nombreSymbole,freqEch,freq,ampl,ampl2))'; 

    case 10,[filename,pathname]=uigetfile({'*.mat';'*.dat'},'Pick your file');
            signal=load(fullfile(pathname,filename));
    
    otherwise '';
end

setappdata(0,'signalUniform',signal');
%disp(size(signal))

%% Pour choix signal par ficher voir uigetfile

%%On obtient le signal non-uniforme

if get(handles.choixEchantillonnage,'Value')==2
  signal=interp1(instantsUniform,signal,instants,'spline');
end

%%
%%Ajout du bruit...ou pas
if get(handles.ajoutBruitBlanc,'Value')==1
   SNRdb=str2double(get(handles.choixSNR,'String'));
   SNR=10^(SNRdb/10);
   amplBruit=sqrt(1/SNR);
   bruit=amplBruit*randn(nombreDePoints,1);
   %disp(size(bruit))
   signal=signal+bruit';
   %signal=signal';
end

setappdata(0,'signal',signal);
setappdata(0,'instants',instants);

%set(0,'Units','pixels') 
%scnsize = get(0,'ScreenSize');
%setappdata(0,'scnsize',scnsize);

%%Test
%figure(1);
%hold on;
%plot(instants,signal);
%figure(2)
%plot(abs(fft(signal)).^2);
%plot(instants,signal,'+');
%%

% --------------------------------------------------------------------
function Untitled_2_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on key press with focus on choixEchantillonnage and none of its controls.
function choixEchantillonnage_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to choixEchantillonnage (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over staticChoixSignal.
function staticChoixSignal_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to staticChoixSignal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on key press with focus on ajoutBruitBlanc2 and none of its controls.
function ajoutBruitBlanc2_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to ajoutBruitBlanc2 (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in clearAll.
function clearAll_Callback(hObject, eventdata, handles)
% hObject    handle to clearAll (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

  close(findobj('type','figure','name','Tracé du signal'));
  close(findobj('type','figure','name','Tracé de la TFD'));
  close(findobj('type','figure','name','TFD log10'));
  close(findobj('type','figure','name','Reconstruction'));
  close(findobj('type','figure','name','Erreur'));

  set(handles.traceSignal,'Value',0);
  set(handles.traceFFT,'Value',0);
  set(handles.tracerFFTlog,'Value',0);
  set(handles.traceReconstruction,'Value',0);
  set(handles.traceErreur,'Value',0);

  clear all;


% --- Executes on key press with focus on clearAll and none of its controls.
function clearAll_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to clearAll (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on key press with focus on lancerSimulation and none of its controls.
function lancerSimulation_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to lancerSimulation (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)



function choixNbrPts_Callback(hObject, eventdata, handles)
% hObject    handle to choixNbrPts (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of choixNbrPts as text
%        str2double(get(hObject,'String')) returns contents of choixNbrPts as a double


% --- Executes during object creation, after setting all properties.
function choixNbrPts_CreateFcn(hObject, eventdata, handles)
% hObject    handle to choixNbrPts (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when idr is resized.
function idr_ResizeFcn(hObject, eventdata, handles)
% hObject    handle to idr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in ajoutBruitBlanc.
function ajoutBruitBlanc_Callback(hObject, eventdata, handles)
% hObject    handle to ajoutBruitBlanc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ajoutBruitBlanc
% Si on ajoute du bruit alors le SNR est disponible
if get(hObject,'Value')==1
     set(handles.choixSNR,'Visible','on');
     set(handles.staticSNR,'Visible','on');
else set(handles.choixSNR,'Visible','off');
     set(handles.staticSNR,'Visible','off');
end


% --- Executes on button press in traceSignal.
function traceSignal_Callback(hObject, eventdata, handles)
% hObject    handle to traceSignal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of traceSignal
if get(hObject,'Value')==1
  signal=getappdata(0,'signal');
  instants=getappdata(0,'instants');

  set(0,'Units','pixels');
  scnsize = get(0,'ScreenSize');

  fig1 = figure('name','Tracé du signal');
  position = get(fig1,'Position');
  outerpos = get(fig1,'OuterPosition');
  borders = outerpos - position;
  
  edge = -borders(1)/2;

if (get(handles.choixCompa,'Value')==1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %%%%% Pour windows %%%%%
  pos1 = [edge,...
        scnsize(4) /1.9,...
        scnsize(3)/2 - edge,...
        scnsize(4)/2.10];
else
  %%%%% Pour mac %%%%%
  pos1 = [edge,...
        scnsize(4) * (2/3),...
        scnsize(3)/2 - edge,...
        scnsize(4)/2];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end
  
  set(fig1,'OuterPosition',pos1);

  %hold on;
  plot(instants,signal);
  title('Signal dans le domaine temporel');
  grid on;
  %plot(instants,signal,'+');
else
  %clear all;
    %if findobj('type','figure','name','Tracé du signal')==1
      close(findobj('type','figure','name','Tracé du signal'));
    %end
end


% --- Executes on button press in traceFFT.
function traceFFT_Callback(hObject, eventdata, handles)
% hObject    handle to traceFFT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of traceFFT
if get(hObject,'Value')==1
  %%Récuperation données
  signal=getappdata(0,'signal');
  instants=getappdata(0,'instants');
  Fe=str2double(get(handles.choixFreqEch,'String'));
  Fe=Fe*10^3;
  Nfft=str2double(get(handles.choixNbrPts,'String'));

  [F,f]=iTFD_gen2(instants',signal',(1/Fe),Nfft); %plus rapide
  %[f,F]=TFDPerso(signal',instants',Fe,Nfft);
  F=abs(F).^2;
  %f=linspace((-Fe/2),(Fe/2),Nfft);
  setappdata(0,'FFT',F);
  setappdata(0,'freqs',f);

  close(findobj('type','figure','name','TFD log10'));
  set(handles.tracerFFTlog,'Value',0);

  fig2 = figure('name','Tracé de la TFD');
  set(0,'Units','pixels') 
  scnsize = get(0,'ScreenSize');
  position = get(fig2,'Position');
  outerpos = get(fig2,'OuterPosition');
  borders = outerpos - position;
  edge = -borders(1)/2;

if (get(handles.choixCompa,'Value')==1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %%%%% Pour windows %%%%%
  pos2 = [scnsize(3)/2 + edge,...
        scnsize(4) /1.9,...
        scnsize(3)/2 - edge,...
        scnsize(4)/2.1];
else  
  %%%%% Pour mac %%%%% 
  pos2 = [scnsize(3)/2 + edge,...
        scnsize(4) * (2/3),...
        scnsize(3)/2 - edge,...
        scnsize(4)/2];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end

  set(fig2,'OuterPosition',pos2);

  plot(f,F);
  xlabel('Frequence(kHz)');
  ylabel('TFD');
  title('TFD du signal');
  grid on;
else
  %clear all;
    %if findobj('type','figure','name','Tracé de la TFD')==1
      close(findobj('type','figure','name','Tracé de la TFD'));
    %end
end


% --- Executes on button press in traceReconstruction.
function traceReconstruction_Callback(hObject, eventdata, handles)
% hObject    handle to traceReconstruction (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of traceReconstruction

if get(handles.choixEchantillonnage,'Value')==2

  signal=getappdata(0,'signal');
  %signalUniform=getappdata(0,'signalUniform');
  instantsUniform=getappdata(0,'uniform');
  instantsNonUniform=getappdata(0,'nonuniform');
  Fe=str2double(get(handles.choixFreqEch,'String'));
  Fe=Fe*10^3;
  F=str2double(get(handles.choixFreq,'String'));
  F=F*10^3;
  N=str2double(get(handles.choixNbrPts,'String'));
  
  if get(hObject,'Value')==1

    switch get(handles.choixReconstruction,'Value')

      case 1, %signalReconst=shannon_reconst(instantsNonUniform,signal,instantsUniform);
            signalReconst = reconstructionShannon(Fe,101,signal',instantsUniform',instantsNonUniform');

      case 2, %signalReconst=reconstruction_matricielle_finale(instantsNonUniform',signal',mean(diff(instantsNonUniform)),21);
            signalReconst = reconstructionMatricielle(signal', instantsNonUniform', instantsUniform',51);

      case 3, signalReconst = reconstruction_splines_cubique(instantsNonUniform',signal',(1/Fe));

      case 4, signalReconst = (reconstructionLagrange(instantsUniform',instantsNonUniform',signal'))';

      case 5, [signalReconst, instantsUniform] = recons_iter(signal, instantsUniform, instantsNonUniform, 51, Fe, F,500,0.1);
    
      otherwise ''; 
    
    end

    setappdata(0,'signalReconst',signalReconst);
    %disp(size(signalReconst));
    %disp(size(signal));

    close(findobj('type','figure','name','Erreur'));
    set(handles.traceErreur,'Value',0);

    fig2 = figure('name','Reconstruction');
    set(0,'Units','pixels') 
    scnsize = get(0,'ScreenSize');
    position = get(fig2,'Position');
    outerpos = get(fig2,'OuterPosition');
    borders = outerpos - position;
    edge = -borders(1)/2;

if (get(handles.choixCompa,'Value')==1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% Pour windows %%%%%
    pos2 = [0,...
          scnsize(4)/20,...
          scnsize(3)/2 - edge,...
          scnsize(4)/2.10 - edge];
else
%%%%% Pour mac %%%%%
    pos2 = [0,...
          0,...
          scnsize(3)/2 - edge,...
          scnsize(4)/2.15 - edge];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end

    set(fig2,'OuterPosition',pos2);

    plot(instantsUniform,signalReconst);
    title('Signal reconstruit');
    grid on;

  else
    %clear all;
    %if findobj('type','figure','name','Reconstruction')==1
      close(findobj('type','figure','name','Reconstruction'));
    %end

  end

end


%%Pour importer fichier voir : http://www.commentcamarche.net/forum/affich-17005255-ouverture-d-un-dossier-d-image-via-gui-matlab

%function pushbutton1_Callback(hObject, eventdata, handles) 
%axes(handles.axes1) 
%[NomFich,NomEmp] = uigetfile({'*.jpg';'*.png';'*.bmp'},'Choisissez une image'); % Choisir une image 
%if isequal(filename,0) 
%%disp('Image non acquise') 
%else 
%%disp(['Image acquise ', fullfile(NomEmp,NomFich)]) 
%end 
%I=imread(NomFich); 
%imshow(I);% Afficher l'image 
%title('Image originelle'); 
%axis on; 
%handles.ImgPret=I; 
%guidata(hObject,handles)


% --- Executes on button press in tracerFFTlog.
function tracerFFTlog_Callback(hObject, eventdata, handles)
% hObject    handle to tracerFFTlog (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of tracerFFTlog

if get(hObject,'Value')==1

  FFT=getappdata(0,'FFT');
  f=getappdata(0,'freqs');
  FFT=10*log10(FFT);

  close(findobj('type','figure','name','Tracé de la TFD'));
  set(handles.traceFFT,'Value',0);

  fig2 = figure('name','TFD log10');
  set(0,'Units','pixels') 
  scnsize = get(0,'ScreenSize');
  position = get(fig2,'Position');
  outerpos = get(fig2,'OuterPosition');
  borders = outerpos - position;
  edge = -borders(1)/2;

if (get(handles.choixCompa,'Value')==1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% Pour windows %%%%%
  pos2 = [scnsize(3)/2 + edge,...
        scnsize(4) /1.9,...
        scnsize(3)/2 - edge,...
        scnsize(4)/2.1];
else
%%%%% Pour mac %%%%%
    pos2 = [scnsize(3)/2 + edge,...
        scnsize(4) * (2/3),...
        scnsize(3)/2 - edge,...
        scnsize(4)/2];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end

  set(fig2,'OuterPosition',pos2);

  plot(f,FFT);
  xlabel('Frequence(kHz)');
  ylabel('TFD en dB');
  title('TFD du signal');
  grid on;

else
  %clear all;
  %if findobj('type','figure','name','TFD log10')==1
    close(findobj('type','figure','name','TFD log10'));
  %end

end



function choixAmpl_Callback(hObject, eventdata, handles)
% hObject    handle to choixAmpl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of choixAmpl as text
%        str2double(get(hObject,'String')) returns contents of choixAmpl as a double


% --- Executes during object creation, after setting all properties.
function choixAmpl_CreateFcn(hObject, eventdata, handles)
% hObject    handle to choixAmpl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function choixSymbol_Callback(hObject, eventdata, handles)
% hObject    handle to choixSymbol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of choixSymbol as text
%        str2double(get(hObject,'String')) returns contents of choixSymbol as a double


% --- Executes during object creation, after setting all properties.
function choixSymbol_CreateFcn(hObject, eventdata, handles)
% hObject    handle to choixSymbol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function choixAmpl2_Callback(hObject, eventdata, handles)
% hObject    handle to choixAmpl2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of choixAmpl2 as text
%        str2double(get(hObject,'String')) returns contents of choixAmpl2 as a double


% --- Executes during object creation, after setting all properties.
function choixAmpl2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to choixAmpl2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in traceErreur.
function traceErreur_Callback(hObject, eventdata, handles)
% hObject    handle to traceErreur (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of traceErreur

if (get(hObject,'Value')==1)

signalReconst = getappdata(0,'signalReconst');
signalUniform = getappdata(0,'signalUniform');
instantsUniform = getappdata(0,'uniform');

if ( length(signalReconst ~= length(signalUniform)))

  A = zeros((length(signalUniform) - length(signalReconst)),1);
  signalReconst = [signalReconst ; A ];
  %disp(size(signalReconst));

end

if ( size(signalReconst) ~= size(signalUniform) )
   
    signalReconst = signalReconst';
    
end

erreur = (signalUniform - signalReconst).^2;
%%disp(erreur)
%%disp(size(erreur))

close(findobj('type','figure','name','Reconstruction'));
set(handles.traceReconstruction,'Value',0);

fig2 = figure('name','Erreur');
    set(0,'Units','pixels') 
    scnsize = get(0,'ScreenSize');
    position = get(fig2,'Position');
    outerpos = get(fig2,'OuterPosition');
    borders = outerpos - position;
    edge = -borders(1)/2;

if (get(handles.choixCompa,'Value')==1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% Pour windows %%%%%
    pos2 = [0,...
          scnsize(4)/20,...
          scnsize(3)/2 - edge,...
          scnsize(4)/2.10 - edge];
else
%%%%% Pour mac %%%%%
    pos2 = [0,...
          0,...
          scnsize(3)/2 - edge,...
          scnsize(4)/2.15 - edge];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end
   
    set(fig2,'OuterPosition',pos2);

    plot(instantsUniform,erreur);
    grid on;
    title('Erreur quadratique de reconstruction');

else

  close(findobj('type','figure','name','Erreur'));

end


% --- Executes on selection change in choixCompa.
function choixCompa_Callback(hObject, eventdata, handles)
% hObject    handle to choixCompa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns choixCompa contents as cell array
%        contents{get(hObject,'Value')} returns selected item from choixCompa


% --- Executes during object creation, after setting all properties.
function choixCompa_CreateFcn(hObject, eventdata, handles)
% hObject    handle to choixCompa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
