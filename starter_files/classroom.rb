# Given a grade_hash, student name, and assignment number, return the score
# for that student and assignment. Note that Ruby counts arrays from 0, but
# we are referring to them as 1-10.
def assignment_score(hash, name, number)
    assignment = number - 1
    hash[name][assignment]
end

# Given a grade_hash and assignment number, return all scores for that
# assignment. Note that Ruby counts arrays from 0, but we are referring to
# them as 1-10.

def assignment_scores(hash, number)
    assignment = number - 1
    hash.map do |key, val|
        hash[key][assignment]
    end
end

# Given a grade_hash and assignment number, return the average score for that
# assignment. Note that Ruby counts arrays from 0, but we are referring to
# them as 1-10.

def assignment_average_score(hash, number)
    assignment = number - 1
    scores = hash.map do |key, val|
                hash[key][assignment]
            end
    scores.sum/scores.length
end

# Return a hash of students and their average score.
# TIP: To convert an array like [[:indiana, 90], [:nevada, 80]] to a hash,
# use .to_h. Also look at Hash#transform_values.
def averages(hash)
    all_arrays = hash.map do |key, val|
                    avg_score = val.sum/val.length
                    [key, avg_score]
                end
    all_arrays.to_h
end

# Return a letter grade for a numerical score.
# 90+ => A
# 80-89 => B
# 70-79 => C
# 60-69 => D
# < 60 => F
def letter_grade(s)
    if s >= 90
        return "A"
    elsif s >= 80
        return "B"
    elsif s >= 70
        return "C"
    elsif s >= 60
        return "D"
    elsif s < 60
        return  "F"
    end
end

# Return a hash of students and their final letter grade, as determined
# by their average.
def final_letter_grades(hash)
    all_arrays = hash.map do |key, val|
                    avg_score = val.sum/val.length
                    [key, letter_grade(avg_score)]
                end
    all_arrays.to_h
end

# Return the average for the entire class.
def class_average(hash)
    student_hash = averages(hash)
    total = student_hash.sum do |key, val|
                val
            end
    total/hash.length
end

# Return an array of the top `number_of_students` students.
def top_students(hash, num)
    i_num = num - 1
    all_arrays = hash.map do |key, val|
        avg_score = val.sum/val.length
        [key, avg_score]
    end
    sorted = all_arrays.sort_by do |k, v|
                v
            end
    good_grades = sorted.reverse
    (0..i_num).map do |i|
        good_grades[i][0]
    end
end
