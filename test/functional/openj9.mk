#############################################################################
#  Copyright IBM Corp. and others 2025
#
#  This program and the accompanying materials are made available under
#  the terms of the Eclipse Public License 2.0 which accompanies this
#  distribution and is available at https://www.eclipse.org/legal/epl-2.0/
#  or the Apache License, Version 2.0 which accompanies this distribution and
#  is available at https://www.apache.org/licenses/LICENSE-2.0.
#
#  This Source Code may also be made available under the following
#  Secondary Licenses when the conditions for such availability set
#  forth in the Eclipse Public License, v. 2.0 are satisfied: GNU
#  General Public License, version 2 with the GNU Classpath
#  Exception [1] and GNU General Public License, version 2 with the
#  OpenJDK Assembly Exception [2].
#
#  [1] https://www.gnu.org/software/classpath/license.html
#  [2] https://openjdk.org/legal/assembly-exception.html
#
#  SPDX-License-Identifier: EPL-2.0 OR Apache-2.0
##############################################################################

#ADD_JVM_LIB_DIR_TO_LIBPATH := $(subst default,compressedrefs,$(ADD_JVM_LIB_DIR_TO_LIBPATH))


# Set ADD_JVM_LIB_DIR_TO_LIBPATH to use compressedrefs dir (instead of default) for IBM Java 8 if -Xcompressedrefs is used
USE_VM_SUBDIR=false
$(info JVM_OPTIONS is '$(JVM_OPTIONS)')

JVM_OPTIONS_VAL=$(JVM_OPTIONS)
ifeq (ibm, $(JDK_IMPL))
ifeq (8,$(JDK_VERSION))
$(info JVM_OPTIONS_VAL is '$(JVM_OPTIONS_VAL)')
ifneq (,$(findstring -Xcompressedrefs,$(JVM_OPTIONS_VAL)))
USE_VM_SUBDIR=true
else ifneq (,$(findstring -Xcompressedrefs,$(JVM_OPTIONS_VAL)))
USE_VM_SUBDIR=true
endif
endif
endif

# replace default with compressedrefs
ifeq (true, $(USE_VM_SUBDIR))
ADD_JVM_LIB_DIR_TO_LIBPATH=$(subst default,compressedrefs,$(ADD_JVM_LIB_DIR_TO_LIBPATH))
endif
