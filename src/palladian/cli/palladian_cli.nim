# ==================== CLI ====================
import cligen
import ./functions/new_impl
import ./functions/dev_impl
import ./functions/serve_impl
import ./functions/build_impl
import ./functions/install_impl

dispatchMulti([newImpl.new], [serve], [dev], [build], [install_impl.install])
