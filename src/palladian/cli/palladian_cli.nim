# ==================== CLI ====================
import cligen
import ./functions/new_impl
import ./functions/dev_impl
import ./functions/serve_impl
import ./functions/build_impl
import ./functions/install_impl
import ./functions/add_impl
import ./functions/remove_impl
import ./functions/update_impl


dispatchMulti(
  [newImpl.new],
  [dev_impl.dev],
  [serve_impl.serve],
  [build_impl.build],
  [install_impl.install],
  [add_impl.add, help={"dev": "Add dependency to \"devDependencies\""}],
  [remove_impl.remove],
  [update_impl.update]
)
