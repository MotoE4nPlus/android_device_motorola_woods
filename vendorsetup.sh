for var in eng user userdebug; do
  add_lunch_combo lineage_mt6737-$var
done

# Patches
cd frameworks/av
git apply -v ../../device/motorola/mt6737/patches/0001-frameworks_av.patch
cd ../..
cd frameworks/base
git apply -v ../../device/motorola/mt6737/patches/0002-frameworks_base.patch
cd ../..
cd system/netd
git apply -v ../../device/motorola/mt6737/patches/0004-system_netd.patch
cd ../..
cd system/core
git apply -v ../../device/motorola/mt6737/patches/0005-system_core.patch
cd ../..
cd frameworks/native
git apply -v ../../device/motorola/mt6737/patches/0003-frameworks_native.patch
cd ../..
