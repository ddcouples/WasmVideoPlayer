ffmpeg -i ./h265-test-640.mp4 -strict -2 -movflags frag_keyframe+empty_moov h264-test-640-fragmented.mp4
ffmpeg -i ./h265-test-640.mp4 -c:v copy -c:a copy -strict -2 -movflags frag_keyframe+empty_moov h265-test-640-fragmented.mp4
ffmpeg -i ./h265-test-640.mp4 -c:a copy -vcodec hevc -r 25 -b:v 400k -bufsize 400k -vf scale=852:480 mock-h265-test-640.mp4 -hide_banner
ffmpeg -i ./h265-test-640.mp4 -c:a copy -vcodec hevc -r 25 -b:v 400k -bufsize 400k mock-h265-test-640.mp4
##### 将moov格式移到前面 ffmpeg v3.3.9 编译
ffmpeg -i ./h265-test-640.mp4 -c:v copy -c:a copy -movflags faststart mock-h265-test-640.mp4