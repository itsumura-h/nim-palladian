when defined(js):
  import ./palladian/preact; export preact
  # import ./palladian/solidjs; export solidjs

# ==================== CLI ====================
when isMainModule:
  import cligen
  import ./palladian/cli/functions/new_impl
  import ./palladian/cli/functions/dev_impl
  import ./palladian/cli/functions/serve_impl
  import ./palladian/cli/functions/build_impl

  dispatchMulti([newImpl.new], [serve], [dev], [build])
