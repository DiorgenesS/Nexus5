import common
import edify_generator

def RemoveDeviceAssert(info):
  edify = info.script
  for i in xrange(len(edify.script)):
    if "ro.product" in edify.script[i]:
      edify.script[i] = """assert(getprop("ro.product.device") == "hammerhead" || getprop("ro.build.product") == "hammerhead" || abort("This package is for device: hammerhead; this device is " + getprop("ro.product.device") + "."););
unmount("/data");
unmount("/system");"""
      return

def ModifyBegin(edify):
    for i in xrange(len(edify.script)):
        if 'ui_print("Target:' in edify.script[i] and "user/release-keys" in edify.script[i]:
            edify.script[i] = '''ui_print("...");'''

def ModifyCommand(edify):
    for i in xrange(len(edify.script)):
        if "package_extract_dir(" in edify.script[i] and "recovery" in edify.script[i]:
            edify.script[i] = 'ui_print("Installing system...");'

def ModifyMountData(edify):
    for i in xrange(len(edify.script)):
        if "mount(" in edify.script[i] and "by-name/userdata" in edify.script[i]:
            edify.script[i] = 'run_program("/sbin/busybox", "mount", "/data");'

def AddArgsForFormatSystem(info):
  edify = info.script
  for i in xrange(len(edify.script)):
    if "format(" in edify.script[i] and "/dev/block/platform/msm_sdcc.1/by-name/system" in edify.script[i]:
      edify.script[i] = 'format("ext4", "EMMC", "/dev/block/platform/msm_sdcc.1/by-name/system", "0", "/system");'
      return

def AddPrompt(edify):
    for i in xrange(len(edify.script)):
        if 'mount("ext4' in edify.script[i] and 'by-name/system' in edify.script[i]:
            edify.script[i] = 'ui_print("Formating Partitions...");\n' + edify.script[i]
        elif 'symlink("../ui/MessageComplete.ogg' in edify.script[i]:
            edify.script[i] = 'ui_print("Creating symlinks...");\n' + edify.script[i]
        elif 'set_metadata_recursive("/system"' in edify.script[i]:
            edify.script[i] = 'ui_print("Setting permissions...");\n' + edify.script[i]
        elif 'package_extract_file("boot' in edify.script[i]:
            edify.script[i] = 'ui_print("Flashing Kernel...");\n' + edify.script[i]

def WritePolicyConfig(info):
  try:
    file_contexts = info.input_zip.read("META/file_contexts")
    common.ZipWriteStr(info.output_zip, "file_contexts", file_contexts)
  except KeyError:
    print "warning: file_context missing from target;"


def FullOTA_InstallEnd(info):
    edify = info.script
    RemoveDeviceAssert(info)
    ModifyBegin(edify)
    ModifyCommand(edify)
    ModifyMountData(edify)
    AddPrompt(edify)
    WritePolicyConfig(info)

def IncrementalOTA_InstallEnd(info):
    RemoveDeviceAssert(info)
