when defined(js):
  import ./palladian/preact; export preact

  # Imports for just generate API docs
  import ./palladian/hooks
  import ./palladian/router
  import ./palladian/format
  import ./palladian/controll_flow

# ==================== CLI ====================
when isMainModule:
  import cligen
  import ./palladian/cli/functions/dev_impl
  import ./palladian/cli/functions/serve_impl
  import ./palladian/cli/functions/build_impl

  dispatchMulti([serve], [dev], [build])
