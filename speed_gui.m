function varargout = speed_gui(varargin)
% SPEED_GUI MATLAB code for speed_gui.fig
%      SPEED_GUI, by itself, creates a new SPEED_GUI or raises the existing
%      singleton*.
%
%      H = SPEED_GUI returns the handle to a new SPEED_GUI or the handle to
%      the existing singleton*.
%
%      SPEED_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SPEED_GUI.M with the given input arguments.
%
%      SPEED_GUI('Property','Value',...) creates a new SPEED_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before speed_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to speed_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help speed_gui

% Last Modified by GUIDE v2.5 30-Apr-2016 22:29:19

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @speed_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @speed_gui_OutputFcn, ...
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
handles.output = 1;
% End initialization code - DO NOT EDIT


% --- Executes just before speed_gui is made visible.
function speed_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to speed_gui (see VARARGIN)
% Choose default command line output for speed_gui
if varargin{1}
handles.output = 1;
end
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes speed_gui wait for user response (see UIRESUME)
%uiwait(handles.speed_gui);
%uiwait;

% --- Outputs from this function are returned to the command line.
function varargout = speed_gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
slider_value = get(hObject,'Value');
handles.output = slider_value;
set(handles.text1,'String',num2str(slider_value));
guidata(hObject,handles);
%uiwait
%uiresume;
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
