  let $G4INCL="/opt/local/include/Geant4/Geant4.10.3/Geant4"
  let $G4INCL_LOCAL="./include"
  setl path+=$G4INCL
  setl path+=$G4INCL_LOCAL
  " let tag_name = '.tags'
  " let tags_path = findfile(tag_name, '.;')
  " if tags_path ==# ''
  " !ctags --languages=C++ -R -f .tags
    " return
  " endif
  " setl tags+=./.tags
  " call Cpp()

