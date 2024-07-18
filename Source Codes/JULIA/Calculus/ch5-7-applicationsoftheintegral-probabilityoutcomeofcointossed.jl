using TikzPictures

function branch(result, n, i=1, prev=[])
    sofar = [prev; result]
    indent = "  "^i
    distance = 5 * 2^(n-i)
    if i == n
        fullbranch = join(sofar, ",")
        prob = "\$p = \\frac{1}{$(2^n)}\$"
        return  """
                $(indent)child [sibling distance=$(distance)ex]
                $(indent)  { node [anchor=west] { $result \$\\cdots\$ ($fullbranch)\\; $prob } }"""
    else
        return  """
                $(indent)child [sibling distance=$(distance)ex] { node {$result}
                $(branch(:T, n, i+1, sofar))
                $(branch(:H, n, i+1, sofar))
                $(indent)}"""
    end
end

function tree(n)
    return """
           \\node {}
           $(branch(:T, n))
           $(branch(:H, n));"""
end

# Open tex in texeditor and add \usepackage{amsmath} before \begin{document}
TikzPicture(options="grow=right", tree(3))
tp = TikzPicture(options="grow=right", tree(3))
tikzDeleteIntermediate(false)
save(PDF("test"), tp)
