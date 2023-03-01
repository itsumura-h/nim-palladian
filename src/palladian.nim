when defined(js):
  # Imports for just generate API docs
  import ./palladian/lib

when isMainModule:
  # ==================== CLI ====================
  import cligen
  import ./palladian/cli/functions/new_impl
  import ./palladian/cli/functions/dev_impl
  import ./palladian/cli/functions/serve_impl
  import ./palladian/cli/functions/build_impl

  dispatchMulti([newImpl.new], [serve], [dev], [build])
