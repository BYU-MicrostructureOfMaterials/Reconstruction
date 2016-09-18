function varargout = Reconstruction(varargin)
% RECONSTRUCTION MATLAB code for Reconstruction.fig
%      RECONSTRUCTION, by itself, creates a new RECONSTRUCTION or raises the existing
%      singleton*.
%
%      H = RECONSTRUCTION returns the handle to a new RECONSTRUCTION or the handle to
%      the existing singleton*.
%
%      RECONSTRUCTION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RECONSTRUCTION.M with the given input arguments.
%
%      RECONSTRUCTION('Property','Value',...) creates a new RECONSTRUCTION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Reconstruction_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Reconstruction_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Reconstruction

% Last Modified by GUIDE v2.5 17-Sep-2016 17:28:56

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Reconstruction_OpeningFcn, ...
                   'gui_OutputFcn',  @Reconstruction_OutputFcn, ...
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


% --- Executes just before Reconstruction is made visible.
function Reconstruction_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Reconstruction (see VARARGIN)

% Choose default command line output for Reconstruction
handles.output = hObject;

handles.grainmap = varargin{1};

handles.OrientationRelationship.String = {'KS','NW'};
handles.OrientationRelationship.Value = 1;
phases = handles.grainmap.phasekey.phasename;
phaseSel(1:size(phases,1),1) = {true};
handles.PhaseTable.Data = [phases phaseSel];

handles.TripletMinNeighborMiso.String = 2;
handles.TrioCutoffMiso.String = 4;
handles.clusterMisoTol.String = 5.2;

handles.criticalOverlapRatio.String = 0.75;

handles.AmbigResMethod.String = {'Simulated Annealing','Best side (fast)'};
handles.AmbigResMethod.Value = 1;
handles.NumTemps.String = 70;
handles.NumTrials.String = 70;
handles.StartAcceptP.String = 0.95;
handles.EndAcceptP.String = 1e-3;

axes(handles.OriginalIPFMap)
imshow(handles.grainmap.grainIPFmap.IPFimage);
imagesc(handles.grainmap.grainIPFmap.IPFimage)

imshow(handles.grainmap.grainIPFmap.IPFimage);

handles.DataPanel.Visible = 'off';
handles.DataPanelBlank.Visible = 'on';

% IMPORTANT: Update handles structure
guidata(hObject, handles);

% UIWAIT makes Reconstruction wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Reconstruction_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in OrientationRelationship.
function OrientationRelationship_Callback(hObject, eventdata, handles)
% hObject    handle to OrientationRelationship (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns OrientationRelationship contents as cell array
%        contents{get(hObject,'Value')} returns selected item from OrientationRelationship


% --- Executes during object creation, after setting all properties.
function OrientationRelationship_CreateFcn(hObject, eventdata, handles)
% hObject    handle to OrientationRelationship (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function clusterMisoTol_Callback(hObject, eventdata, handles)
% hObject    handle to clusterMisoTol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of clusterMisoTol as text
%        str2double(get(hObject,'String')) returns contents of clusterMisoTol as a double


% --- Executes during object creation, after setting all properties.
function clusterMisoTol_CreateFcn(hObject, eventdata, handles)
% hObject    handle to clusterMisoTol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function TrioCutoffMiso_Callback(hObject, eventdata, handles)
% hObject    handle to TrioCutoffMiso (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TrioCutoffMiso as text
%        str2double(get(hObject,'String')) returns contents of TrioCutoffMiso as a double


% --- Executes during object creation, after setting all properties.
function TrioCutoffMiso_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TrioCutoffMiso (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function TripletMinNeighborMiso_Callback(hObject, eventdata, handles)
% hObject    handle to TripletMinNeighborMiso (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TripletMinNeighborMiso as text
%        str2double(get(hObject,'String')) returns contents of TripletMinNeighborMiso as a double


% --- Executes during object creation, after setting all properties.
function TripletMinNeighborMiso_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TripletMinNeighborMiso (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in AmbigResMethod.
function AmbigResMethod_Callback(hObject, eventdata, handles)
% hObject    handle to AmbigResMethod (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns AmbigResMethod contents as cell array
%        contents{get(hObject,'Value')} returns selected item from AmbigResMethod
value = GetPopupValue(hObject);
if strcmp(value,'Simulated Annealing')
    enable = 'on';
else
    enable = 'off';
end 
handles.NumTemps.Enable = enable;
handles.NumTrials.Enable = enable;
handles.StartAcceptP.Enable = enable;
handles.EndAcceptP.Enable = enable;
    


% --- Executes during object creation, after setting all properties.
function AmbigResMethod_CreateFcn(hObject, eventdata, handles)
% hObject    handle to AmbigResMethod (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function NumTemps_Callback(hObject, eventdata, handles)
% hObject    handle to NumTemps (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of NumTemps as text
%        str2double(get(hObject,'String')) returns contents of NumTemps as a double


% --- Executes during object creation, after setting all properties.
function NumTemps_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NumTemps (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function NumTrials_Callback(hObject, eventdata, handles)
% hObject    handle to NumTrials (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of NumTrials as text
%        str2double(get(hObject,'String')) returns contents of NumTrials as a double


% --- Executes during object creation, after setting all properties.
function NumTrials_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NumTrials (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function StartAcceptP_Callback(hObject, eventdata, handles)
% hObject    handle to StartAcceptP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of StartAcceptP as text
%        str2double(get(hObject,'String')) returns contents of StartAcceptP as a double


% --- Executes during object creation, after setting all properties.
function StartAcceptP_CreateFcn(hObject, eventdata, handles)
% hObject    handle to StartAcceptP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EndAcceptP_Callback(hObject, eventdata, handles)
% hObject    handle to EndAcceptP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EndAcceptP as text
%        str2double(get(hObject,'String')) returns contents of EndAcceptP as a double


% --- Executes during object creation, after setting all properties.
function EndAcceptP_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EndAcceptP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function MinRedundantOverlapRatio_Callback(hObject, eventdata, handles)
% hObject    handle to MinRedundantOverlapRatio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of MinRedundantOverlapRatio as text
%        str2double(get(hObject,'String')) returns contents of MinRedundantOverlapRatio as a double


% --- Executes during object creation, after setting all properties.
function MinRedundantOverlapRatio_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MinRedundantOverlapRatio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function criticalOverlapRatio_Callback(hObject, eventdata, handles)
% hObject    handle to criticalOverlapRatio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of criticalOverlapRatio as text
%        str2double(get(hObject,'String')) returns contents of criticalOverlapRatio as a double


% --- Executes during object creation, after setting all properties.
function criticalOverlapRatio_CreateFcn(hObject, eventdata, handles)
% hObject    handle to criticalOverlapRatio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function RedundantClusterMiso_Callback(hObject, eventdata, handles)
% hObject    handle to RedundantClusterMiso (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of RedundantClusterMiso as text
%        str2double(get(hObject,'String')) returns contents of RedundantClusterMiso as a double


% --- Executes during object creation, after setting all properties.
function RedundantClusterMiso_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RedundantClusterMiso (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in ReconstructButton.
function ReconstructButton_Callback(hObject, eventdata, handles)
% hObject    handle to ReconstructButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
phaseSel = [handles.PhaseTable.Data{:,2}];
phaseIDs = handles.grainmap.phasekey.phaseID(phaseSel);

% Create Reconstructor
steps = 5;
w = waitbar(0,['Creating Reconstructor Object (Step 1/' num2str(steps) ') ...']);
R = Reconstructor(handles.grainmap,GetPopupValue(handles.OrientationRelationship),phaseIDs);
R.tripletMinNeighborMiso = str2double(handles.TripletMinNeighborMiso.String)*pi/180;
R.trioCutoffMiso = str2double(handles.TrioCutoffMiso.String)*pi/180;
R.clusterMisoTol = str2double(handles.clusterMisoTol.String)*pi/180;

R.criticalOverlapRatio = str2double(handles.criticalOverlapRatio.String);

R.ambiguityMethod = handles.AmbigResMethod.String{handles.AmbigResMethod.Value};
R.numTemps = str2num(handles.NumTemps.String);
R.numTrials = str2num(handles.NumTrials.String);
R.startAcceptP = str2double(handles.StartAcceptP.String);
R.endAcceptP = str2double(handles.EndAcceptP.String);

% Find Triplets
waitbar(1/steps,w,['Finding triplets (Step 2/' num2str(steps) ') ...']);
R.find_triplets;

% Find Trios
waitbar(2/steps,w,['Finding trios (Step 3/' num2str(steps) ') ...']);
R.find_trios;

% Grow Clusters
waitbar(3/steps,w,['Growing clusters (Step 4/' num2str(steps) ') ...']);
R.grow_clusters_from_trios;

% Place Clusters
waitbar(4/steps,w,['Placing clusters (Step 5/' num2str(steps) ') ...']);
R.place_clusters;


R.genReconstructedIPFmap('filled');
axes(handles.ReconstructedIPFMap)
imshow(R.reconstructedIPFmap.IPFimage);

waitbar(1,w,'Finished Reconstruction')
close(w)

handles.DataPanel.Visible = 'on';
handles.DataPanelBlank.Visible = 'off';

handles.reconstructor = R;
handles.selecteddata = SelectedData();
guidata(hObject, handles);


function value = GetPopupValue(Popup)
list = Popup.String;
value = list{Popup.Value};


% --- Executes on button press in SelectGrainDataPoints.
function SelectGrainDataPoints_Callback(hObject, eventdata, handles)
% hObject    handle to SelectGrainDataPoints (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

selectedData = handles.selecteddata;
R = handles.reconstructor;
IDs = selectedData.point_select_IPF_data(handles.OriginalIPFMap,R,'daughterGrains');
grains = R.grainmap.grains(ismember([R.grainmap.grains.OIMgid],IDs));
selectedData.add_data(grains);



% --- Executes on button press in SelectGrainRegion.
function SelectGrainRegion_Callback(hObject, eventdata, handles)
% hObject    handle to SelectGrainRegion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
selectedData = handles.selecteddata;
R = handles.reconstructor;
[BW,IDs] = selectedData.poly_select_IPF_data(handles.OriginalIPFMap,R,'daughterGrains');
grains = R.grainmap.grains(ismember([R.grainmap.grains.OIMgid],IDs));
selectedData.add_data(grains);


% --- Executes on button press in PlotSelectedData.
function PlotSelectedData_Callback(hObject, eventdata, handles)
% hObject    handle to PlotSelectedData (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

inclGrains = handles.toggle_grain_orientations.Value;
inclPosParents = handles.toggle_theoretical_parents.Value;
inclClusters = handles.toggle_cluster_orientations.Value;
inclPosDaughters = handles.toggle_theoretical_daughters.Value;
inclDaughters = handles.toggle_daughter_orientations.Value;
inclNonMembers = handles.toggle_included_non_member_grains.Value;

h = figure;

if inclGrains
    grainsToPlot = handles.selecteddata.selectedGrains;
    grainOrientations = [grainsToPlot.orientation];
    grainQuats = [grainOrientations.quat];
    pole_figure_by_quat(grainQuats','b*',5,h.Number);
end

if inclPosParents
    grains = handles.selecteddata.selectedGrains;
    grainPosParentOrientations = [grains.newPhaseOrientations];
    posParentQuats = [grainPosParentOrientations.quat];
    pole_figure_by_quat(posParentQuats','bd',3,h.Number);
end

if inclClusters
    clusters = handles.selecteddata.selectedClusters;
    clusterOrientations = [clusters.clusterOCenter];
    clusterQuats = [clusterOrientations.quat];
    pole_figure_by_quat(clusterQuats','r*',5,h.Number);
end

if inclPosDaughters
    clusters = handles.selecteddata.selectedClusters;
    posDaughterOrientations = [clusters.theoreticalVariants];
    posDaughterQuats = [posDaughterOrientations.quat];
    pole_figure_by_quat(posDaughterQuats','rd',3,h.Number);
end

if inclDaughters
    clusters = handles.selecteddata.selectedClusters;
    members = [clusters.memberGrains];
    daughterOrientations = [members.orientation];
    daughterQuats = [daughterOrientations.quat];
    pole_figure_by_quat(daughterQuats','k.',1,h.Number);
end

if inclNonMembers
    clusters = handles.selecteddata.selectedClusters;
    inclNonMembers = [clusters.includedNonMemberGrains];
    inclNonMemberOrientations = [inclNonMembers.orientation];
    inclNonMemberQuats = [inclNonMemberOrientations.quat];
    pole_figure_by_quat(inclNonMemberQuats','k.',1,h.Number);
end


% --- Executes on button press in ClearSelectedData.
function ClearSelectedData_Callback(hObject, eventdata, handles)
% hObject    handle to ClearSelectedData (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.selecteddata.clear_grains;
handles.selecteddata.clear_clusters;

% --- Executes on button press in ReassignDaughterRegion.
function ReassignDaughterRegion_Callback(hObject, eventdata, handles)
% hObject    handle to ReassignDaughterRegion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in ReassignPARegion.
function ReassignPARegion_Callback(hObject, eventdata, handles)
% hObject    handle to ReassignPARegion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in RedivideClusterOverlap.
function RedivideClusterOverlap_Callback(hObject, eventdata, handles)
% hObject    handle to RedivideClusterOverlap (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in RecalculatePAOrientation.
function RecalculatePAOrientation_Callback(hObject, eventdata, handles)
% hObject    handle to RecalculatePAOrientation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in ExpandNeighbor.
function ExpandNeighbor_Callback(hObject, eventdata, handles)
% hObject    handle to ExpandNeighbor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in FillUnallocatedbyCluster.
function FillUnallocatedbyCluster_Callback(hObject, eventdata, handles)
% hObject    handle to FillUnallocatedbyCluster (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in WriteAngFile.
function WriteAngFile_Callback(hObject, eventdata, handles)
% hObject    handle to WriteAngFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in toggle_cluster_orientations.
function toggle_cluster_orientations_Callback(hObject, eventdata, handles)
% hObject    handle to toggle_cluster_orientations (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of toggle_cluster_orientations


% --- Executes on button press in toggle_theoretical_daughters.
function toggle_theoretical_daughters_Callback(hObject, eventdata, handles)
% hObject    handle to toggle_theoretical_daughters (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of toggle_theoretical_daughters


% --- Executes on button press in toggle_daughter_orientations.
function toggle_daughter_orientations_Callback(hObject, eventdata, handles)
% hObject    handle to toggle_daughter_orientations (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of toggle_daughter_orientations


% --- Executes on button press in toggle_included_non_member_grains.
function toggle_included_non_member_grains_Callback(hObject, eventdata, handles)
% hObject    handle to toggle_included_non_member_grains (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of toggle_included_non_member_grains


% --- Executes on button press in toggle_grain_orientations.
function toggle_grain_orientations_Callback(hObject, eventdata, handles)
% hObject    handle to toggle_grain_orientations (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of toggle_grain_orientations


% --- Executes on button press in toggle_theoretical_parents.
function toggle_theoretical_parents_Callback(hObject, eventdata, handles)
% hObject    handle to toggle_theoretical_parents (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of toggle_theoretical_parents


% --- Executes on button press in SelectClusterDataPoints.
function SelectClusterDataPoints_Callback(hObject, eventdata, handles)
% hObject    handle to SelectClusterDataPoints (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
selectedData = handles.selecteddata;
R = handles.reconstructor;
IDs = selectedData.point_select_IPF_data(handles.ReconstructedIPFMap,R,'PA');
clusters = R.clusters(ismember([R.clusters.ID],IDs));
selectedData.add_data(clusters);


% --- Executes on button press in SelectClusterRegion.
function SelectClusterRegion_Callback(hObject, eventdata, handles)
% hObject    handle to SelectClusterRegion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
selectedData = handles.selecteddata;
R = handles.reconstructor;
[BW, IDs] = selectedData.poly_select_IPF_data(handles.ReconstructedIPFMap,R,'PA');
clusters = R.clusters(ismember([R.clusters.ID],IDs));
selectedData.add_data(clusters);

