rm -rf ./remuxing.js ./remuxing.wasm

export TOTAL_MEMORY=67108864
export EXPORTED_FUNCTIONS="[
    '_main',
    '_malloc',
    '_free'
]"

echo "Running Emscripten..."
emcc remuxing.c ../dist/lib/libavformat.a ../dist/lib/libavcodec.a ../dist/lib/libavutil.a ../dist/lib/libswscale.a \
    -I "../dist/include" \
    -s WASM=1 \
    -s TOTAL_MEMORY=${TOTAL_MEMORY} \
    -s EXPORTED_FUNCTIONS="${EXPORTED_FUNCTIONS}" \
    -s EXTRA_EXPORTED_RUNTIME_METHODS="['addFunction']" \
    -s RESERVED_FUNCTION_POINTERS=14 \
    -s FORCE_FILESYSTEM=1 \
    -o remuxing.js
    # -O3 \

echo "Finished Build"


