function mono_arr = stereoToMono(stereo_arr)
    mono_arr = (stereo_arr(:,1) + stereo_arr(:,2))/2;
end
