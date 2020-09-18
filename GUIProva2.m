function varargout = GUIProva2(varargin)
% GUIPROVA2 M-file for GUIProva2.fig
%      GUIPROVA2, by itself, creates a new GUIPROVA2 or raises the existing
%      singleton*.
%
%      H = GUIPROVA2 returns the handle to a new GUIPROVA2 or the handle to
%      the existing singleton*.
%
%      GUIPROVA2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUIPROVA2.M with the given input arguments.
%
%      GUIPROVA2('Property','Value',...) creates a new GUIPROVA2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUIProva2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUIProva2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUIProva2

% Last Modified by GUIDE v2.5 16-Oct-2013 17:08:54

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUIProva2_OpeningFcn, ...
                   'gui_OutputFcn',  @GUIProva2_OutputFcn, ...
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


% --- Executes just before GUIProva2 is made visible.
function GUIProva2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUIProva2 (see VARARGIN)

% Choose default command line output for GUIProva2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUIProva2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUIProva2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;




% --- Executes on button press in START.
function START_Callback(hObject, eventdata, handles)
% hObject    handle to START (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
scripts.HoloGenerator(handles);


% --- Executes during object creation, after setting all properties.
function Beam_type_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Beam_type (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1


% --- Executes during object creation, after setting all properties.
function Status_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Status (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



% --- Executes on button press in Correct.
function Correct_Callback(hObject, eventdata, handles)
% hObject    handle to Correct (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Correct



% --- Executes on button press in MakeDesign.
function MakeDesign_Callback(hObject, eventdata, handles)
% hObject    handle to MakeDesign (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of MakeDesign

% --- Executes during object creation, after setting all properties.
function MakeDesign_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MakeDesign (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called




% --- Executes on button press in DesignFile.
function DesignFile_Callback(hObject, eventdata, handles)
% hObject    handle to DesignFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of DesignFile


% --- Executes on button press in Hologram.
function Hologram_Callback(hObject, eventdata, handles)
% hObject    handle to Hologram (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Hologram



% --- Executes on button press in Macropixel.
function Macropixel_Callback(hObject, eventdata, handles)
% hObject    handle to Macropixel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Macropixel


% --- Executes on button press in Simulate.
function Simulate_Callback(hObject, eventdata, handles)
% hObject    handle to Simulate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Simulate


% --- Executes on button press in Stokes.
function Stokes_Callback(hObject, eventdata, handles)
% hObject    handle to Stokes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Stokes


% --- Executes on button press in Make_designs.
function Make_designs_Callback(hObject, eventdata, handles)
% hObject    handle to Make_designs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over Make_designs.
function Make_designs_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to Make_designs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

hTabGroup = uitabgroup; drawnow;
tab1 = uitab(hTabGroup, 'title','Panel 1');
a = axes('parent', tab1); surf(peaks);
tab2 = uitab(hTabGroup, 'title','Panel 2');
uicontrol(tab2, 'String','Close', 'Callback','close(gcbf)');
