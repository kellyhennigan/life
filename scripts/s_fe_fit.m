function fe = s_fe_fit(hemisphere)
%
% Illustrate how to open up data and run a small linear fascicle evaluation
% (LIFE).
% 
% s_fe_fit
%
%
% Written by Franco Pestilli (c) 2013 Stanford VISTA team.

switch hemisphere
    case 'left'
         fgFileName = '/azure/scr1/frk/150dirs_b1000_b2000_b4000/life_mrtrix_rep1/FP_LH_DTI_b2000_0005_Lmax8_prob.pdb';
    case 'right'
         fgFileName = '/azure/scr1/frk/150dirs_b1000_b2000_b4000/life_mrtrix_rep1/FP_RH_DTI_b2000_0005_Lmax8_prob.pdb';
end

dtFile        = '/biac2/wandell2/data/diffusion/pestilli/20110922_1125/dt6.mat';
dwiFile       = '/biac2/wandell2/data/diffusion/pestilli/20110922_1125/raw/0005_01_DTI_2mm_150dir_2x_b2000_aligned_trilin.nii.gz';
dwiFileRepeat = '/biac2/wandell2/data/diffusion/pestilli/20110922_1125/raw/0009_01_DTI_2mm_150dir_2x_b2000_aligned_trilin.nii.gz';
t1File        = '/biac2/wandell2/data/diffusion/pestilli/20110922_1125/t1/t1.nii.gz';
savedir       = '/azure/scr1/frk/150dirs_b1000_b2000_b4000/life_mrtrix_rep1/results/lh';
   
%% Initialize the Connectome
fe = feConnectomeInit(dwiFile,dtFile,fgFileName,feFileName,savedir,dwiFileRepeat,t1File);

%% Now reduce the size of the fiber groups
fe = feConnectomeCullNew(fe);

%% Save it
feConnectomeSave(fe);

return
