# .bashrc                                                                                                                        
                                                                                                                                 
# Source global definitions                                                                                                      
if [ -f /etc/bashrc ]; then                                                                                                      
        . /etc/bashrc                                                                                                            
fi                                                                                                                               
                                                                                                                                 
# User specific aliases and functions                                                                                            
#export PS1='\w`hg prompt "[{branch}{status}]" 2>/dev/null` $'

QUESTA_HOME=/eda/tools/mentor/questasim.2021.4_2
export PATH=$PATH:$QUESTA_HOME/bin
export LM_LICENSE_FILE=1717@europa.tele.ntnu.no:5280@europa.tele.ntnu.no:1700@europa.tele.ntnu.no:7101@onespin.lisens.ntnu.no

export ONESPINROOT=/eda/tools/onespin/onespin360.2021.2.3
export PATH=$ONESPINROOT/bin:$PATH

