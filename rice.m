function varargout = rice(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @rice_OpeningFcn, ...
                   'gui_OutputFcn',  @rice_OutputFcn, ...
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

function rice_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;

guidata(hObject, handles);

function varargout = rice_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
[F,PathName,FilterIndex] = uigetfile({'*.*','All Files(*.*)'},'Select your File');
input=strcat(PathName,F);
RGBimage=importdata(input);
axes(handles.axes1);
imshow(RGBimage);
background = imopen(RGBimage,strel('disk',15));
I2 = RGBimage - background;
img2=im2bw(RGBimage,graythresh(RGBimage+5));
x=[1 1 1]*1/3;
s=convn(img2,x,'same');
I = imadjust(s,[0.7 0.9],[]);

axes(handles.axes2);
imshow(I2);

axes(handles.axes3);
imshow(img2);

axes(handles.axes4);
imshow(s);

axes(handles.axes5);
imshow(I);

B = bwboundaries(I);
RGB_label = label2rgb(img2,[.0 .0 .0], 'black', 'shuffle');
axes(handles.axes6);
imshow(RGB_label)
hold on
for k = 1:length(B)
boundary = B{k};
plot(boundary(:,2), boundary(:,1),'white', 'LineWidth', 0.2)
end
text(10,10,strcat('\color{white}Objects Found:',num2str(length(B))));

set(handles.text1,'String',k);
guidata(hObject,handles);
